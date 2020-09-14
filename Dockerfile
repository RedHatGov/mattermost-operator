FROM quay.io/operator-framework/ansible-operator:v1.0.0

ENV ANSIBLE_HASH_BEHAVIOUR=merge \
    ANSIBLE_VERBOSITY=3

COPY requirements.yml ${HOME}/requirements.yml
RUN ansible-galaxy collection install -r ${HOME}/requirements.yml \
 && chmod -R ug+rwx ${HOME}/.ansible

COPY watches.yaml ${HOME}/watches.yaml
COPY roles/ ${HOME}/roles/
COPY playbooks/ ${HOME}/playbooks/
