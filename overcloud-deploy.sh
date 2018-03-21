#!/bin/bash

exec openstack overcloud deploy \
        --templates /usr/share/openstack-tripleo-heat-templates \
	-r /home/stack/templates/roles_data.yaml \
	-e /home/stack/templates/global-config.yaml \
	-e /home/stack/templates/fencing.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
        -e /home/stack/templates/network-environment.yaml \
	-e /home/stack/templates/HostnameMap.yaml \
	-e /home/stack/templates/ips-from-pool-all.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
	-e /home/stack/templates/ceph-config.yaml \
	-e /home/stack/templates/docker-registry.yaml \
	-e /home/stack/templates/enable-tls.yaml \
	-e /home/stack/templates/inject-trust-anchor.yaml \
	-e /usr/share/openstack-tripleo-heat-templates/environments/tls-endpoints-public-ip.yaml \
	-e /home/stack/templates/rsvd_host_memory.yaml \
	-p /home/stack/templates/plan-environment-derived-params.yaml \
	--timeout 120 2>&1 | tee ~/deploy.log
