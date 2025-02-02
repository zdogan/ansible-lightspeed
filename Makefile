.PHONY: all install-ansible run-playbook setup-openshift clean

all: install-ansible run-playbook setup-openshift

install-ansible:
    @echo "Installing Ansible..."
    pip install ansible

run-playbook:
    @echo "Running Ansible playbooks..."
    ansible-playbook -i inventory local-playbook.yml
    ansible-playbook -i inventory firewall-playbook.yml
    ansible-playbook -i inventory cluster-playbook.yml

setup-openshift:
    @echo "Setting up OpenShift cluster..."
    mkdir -p /root/openshift-install
    cp install-config.yml /root/openshift-install/install-config.yml
    openshift-install create cluster --dir /root/openshift-install --log-level=info

clean:
    @echo "Cleaning up..."
    rm -rf /root/openshift-install