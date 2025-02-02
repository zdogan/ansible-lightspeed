# Ansible LightSpeed with IBM Watsonx Code Assistant  

**Ansible LightSpeed (ALS) with IBM Watsonx Code Assistant** is a generative AI tool designed to help users **write high-quality Ansible code faster and more efficiently**, while increasing the **scope and impact** of automation efforts.  

IBM Watson Code Assistant is a **large language model** trained on **Red Hat Ansible Galaxy data** and other open-source sources. It generates **AI-powered code completions** based on prompts and best practices from the **Ansible Galaxy community**, a key part of Red Hat.  

Theoretically, the **LLM understands the environment** and updates parameters accordingly, improving automation efficiency.  

---

## **Deploying a Cluster Using Ansible**  
When deploying a cluster using an Ansible playbook, automation simplifies the process by handling:  

1. **Provisioning Servers** – Ansible provisions cloud or on-prem servers and configures them for the cluster.  
2. **Configuring Networking** – Sets up **IP addresses, subnets, and security groups** for communication.  
3. **Deploying Applications** – Automates the deployment of **databases, web servers, or microservices**.  

---

## **Folder Structure**  

The playbooks in this repository handle different stages of cluster setup:  

| **File**                   | **Purpose** |
|----------------------------|------------|
| `local-playbook.yml`       | Configures a local MacBook Pro for development |
| `bastion-playbook.yml`     | Sets up the **bastion host** |
| `cluster-playbook.yml`     | Installs the **Kubernetes/OpenShift cluster** |
| `firewall-playbook.yml`    | Configures **pfSense firewall rules** |

We segmented the playbooks to distinguish tasks that were:  
- **Fully AI-generated**  
- **AI-assisted but required human modification**  
- **Manually written**  

The final result is a **fully operational cluster** with automation-enhanced deployment.

---

## **Tools & Approaches for Developing Ansible Playbooks**  

### **1. Jinja2 Templates**  

- Ansible uses **Jinja2 templating** to define **dynamic content** in playbooks.  
- **Usage:** Create flexible and reusable templates for **install-config.yml**.  

💡 **Example:** A Jinja template to define cluster deployment settings:  
```yaml
apiVersion: v1
baseDomain: {{ cluster_domain }}
compute:
- hyperthreading: Enabled
  name: worker
  replicas: {{ worker_count }}


### 2. **Ansible Lint**  

- **Description:** Ensures **best practices, consistency, and error-free** playbooks.  
- **Usage:** Run `ansible-lint` to validate playbooks before deployment.  

💡 **Example:**  
```bash
ansible-lint cluster-playbook.yml

---

## **3. Ansible Vault**  
- **Description:** Encrypts sensitive data like passwords or API keys.  
- **Usage:** Securely store credentials in playbooks.  

💡 **Example:**  
```sh
ansible-vault encrypt secrets.yml
```
To use encrypted variables in playbooks:  
```yaml
vars_files:
  - secrets.yml
```

---

## **Setting Up Your Local Environment**  

1. **Install Ansible**  
```sh
brew install ansible
```
2. **Install Ansible Lint**  
```sh
python3 -m pip install --user ansible-lint
```
3. **Verify installation**  
```sh
which python3 ansible ansible-lint
```
Example Output:  
```
/Library/Frameworks/Python.framework/Versions/3.9/bin/python3
/usr/local/bin/ansible
/usr/local/bin/ansible-lint
```

---

## **AI Contribution Analysis**  

Total **66 tasks** across **19 roles** → **627 lines of code (LOC)**.  
- **Average LOC per task:** `627 / 66 = 9.5` LOC/task  
- **AI-generated lines:** `19 roles × 9.5 LOC = 180 LOC`  

### **AI vs. Human Contribution Breakdown**  
| **Tasks**                | **% AI-Generated** | **% Human-Written** |
|--------------------------|--------------------|---------------------|
| 17 tasks                | 100% LightSpeed    | 0% |
| 11 tasks                | 80% LightSpeed     | 20% |
| 6 tasks                 | 50% LightSpeed     | 50% |
| 32 tasks                | 0% LightSpeed      | 100% |

🔹 **28.73% of total code is AI-generated**, improving from **20% in the last evaluation**.  

---

## **References & Resources**  

- 📖 [Ansible AWS EC2 Module](https://docs.ansible.com/ansible/latest/collections/amazon/aws/ec2_instance_module.html)  
- 📖 [IBM Watsonx Ansible LightSpeed User Guide](https://access.redhat.com/documentation/en-us/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant/2.x_latest/html/red_hat_ansible_lightspeed_with_ibm_watsonx_code_assistant_user_guide/lightspeed-intro)  
- 📖 [Ansible Documentation](https://docs.ai.ansible.redhat.com/)  
- 🎥 [YouTube: Introduction to Ansible LightSpeed](https://www.youtube.com/watch?v=Ty2d-nlnZPQ)   
- 🛠 [Ansible Lint Best Practices](https://www.redhat.com/sysadmin/ansible-lint-YAML)  
- 📂 [GitHub: Ansible-WCA Demo Kit](https://github.com/chetan-hireholi/ansible-wca-demo-kit)  
- 📂 [GitHub: LightSpeed Demos](https://github.com/craig-br/lightspeed-demos?tab=readme-ov-file)  
- 📝 [Ansible LightSpeed Blog](https://www.ansible.com/blog/welcome-to-the-ansible-lightspeed-technical-preview)  
- 🎮 [Interactive Playbook Writing](https://play.instruqt.com/embed/redhat/tracks/writing-first-playbook?token=em_epihlg9zuxia3gzi&show_challenges=true)  

---  

