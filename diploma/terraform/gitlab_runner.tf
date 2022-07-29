# Создаем файл inventory.yml для ansible

resource "local_file" "create_ansible_file_gl_runner" {
  content = <<-DOC
    - hosts: wordpress
      become: true
      become_method: sudo
      become_user: root
      remote_user: ubuntu
      tasks: 
        - name: set script vars 
          set_fact:
            runner_token: "{{ runner_token }}"
            gitlab_repository_installation_script_url: "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh"
      
        - name: Download GitLab repository installation script.
          get_url:
            url: "{{ gitlab_repository_installation_script_url }}"
            dest: /tmp/gitlab_install_repository.sh
      
        - name: Install GitLab repository.
          command: bash /tmp/gitlab_install_repository.sh
      
        - name: Install GitLab runner
          apt:
            name: "gitlab-runner"
            state: present
      
        - name: register runner
          become: true
          command: gitlab-runner register -n --url http://gitlab --registration-token {{ runner_token }} --executor shell --description "Shell Runner" --tag-list deployment 
      
        - name: Add gitlab-runner user to sudoers
          user:
            name=gitlab-runner
            groups=sudo
            append=yes
            state=present

        - name: Allow gitlab-runner user to have passwordless sudo
          lineinfile:
            dest: /etc/sudoers
            state: present
            regexp: '^gitlab-runner'
            line: 'gitlab-runner ALL=(ALL) NOPASSWD: ALL'
            validate: 'visudo -cf %s'

        - name: download Wordpress CLI
          command: curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /tmp/wp-cli.phar
          args:
            creates: "/tmp/wp-cli.phar"
      
        - name: move the binary to the final destination
          copy:
            src: "/tmp/wp-cli.phar"
            dest: "/usr/local/bin/wp"
            owner: "root"
            group: "root"
            mode: 0755
            remote_src: yes

        - name: add local entry to hosts 
          shell: |
            echo "$(getent hosts gitlab | awk '{ print $1 }') gitlab.${var.fqdn}" | sudo tee -a /etc/hosts

    DOC
  filename = "../ansible/prepare.yml"
  file_permission = "0644"
}
