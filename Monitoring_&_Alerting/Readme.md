##### Install Prometheus
```
    wget https://github.com/prometheus/prometheus/releases/download/v3.2.1/prometheus-3.2.1.linux-amd64.tar.gz
    tar -xvzf prometheus-3.2.1.linux-amd64.tar.gz
    cd prometheus-3.2.1.linux-amd64
    sudo firewall-cmd --permanent --zone=public --add-port=9090/tcp
    sudo firewall-cmd --reload
    ./prometheus
```
- Access Prometheus by using Public_IP:9090

##### Install Node_Exporter
```
    wget https://github.com/prometheus/node_exporter/releases/download/v1.9.0/node_exporter-1.9.0.linux-amd64.tar.gz
    tar -xvzf node_exporter-1.9.0.linux-amd64.tar.gz
    cd node_exporter-1.9.0.linux-amd64
    sudo firewall-cmd --permanent --zone=public --add-port=9100/tcp
    sudo firewall-cmd --reload
    ./node_exporter
```
- Access Node_Exporter by using Public_IP:9100/metrics
- Add Node_exporter to the Prometheus
    ```
    cd prometheus-3.2.1.linux-amd64
    vim prometheus.yml
    ```
- Add these lines under **scrape_configs**
    ```
    - job_name: 'node_exporter'
      
       # metrics_path defaults to '/metrics'
       # scheme defaults to 'http'

       static_configs:
       - targets: ['localhost:9100']  
    
    ```
- save and exit from the file.
- Once again re-start the prometheus
    ```
    ./prometheus
    ```
- Access Prometheus by using Public_IP:9090
- Here we can see the node_exporter endpoints

##### Install Blackbox_exporter
```
    wget https://github.com/prometheus/blackbox_exporter/releases/download/v0.26.0/blackbox_exporter-0.26.0.linux-amd64.tar.gz
    tar -xvzf blackbox_exporter-0.26.0.linux-amd64.tar.gz
    cd blackbox_exporter-0.26.0.linux-amd64
    sudo firewall-cmd --permanent --zone=public --add-port=9115/tcp
    sudo firewall-cmd --reload
    ./blackbox_exporter
```
- Access blackbox_Exporter by using Public_IP:9115/metrics
- Add blackbox to the Prometheus
    ```
    cd prometheus-3.2.1.linux-amd64
    vim prometheus.yml
    ```
- Add these lines under **scrape_configs**
    ```
    - job_name: 'blackbox_exporter'
      
       # metrics_path defaults to '/metrics'
       # scheme defaults to 'http'

       static_configs:
       - targets: ['localhost:9115']  
    
    ```
- save and exit from the file.
- Once again re-start the prometheus
    ```
    ./prometheus
    ```
- Access Prometheus by using Public_IP:9090
- Here we can see the blackbox_exporter endpoints

##### Install AlertManager
```
    wget https://github.com/prometheus/alertmanager/releases/download/v0.28.1/alertmanager-0.28.1.linux-amd64.tar.gz
    tar -xvzf alertmanager-0.28.1.linux-amd64.tar.gz
    cd alertmanager-0.28.1.linux-amd64
    sudo firewall-cmd --permanent --zone=public --add-port=9093/tcp
    sudo firewall-cmd --reload
    ./alertmanager
```
- Access the alert_manager using Public_IP:9093
- Add alertManager to the Prometheus
    ```
    cd prometheus-3.2.1.linux-amd64
    vim prometheus.yml
    ```
- Add these lines under **Alert Manager Configuration**
    ```
        alerting:
          alertmanagers:
          - static_configs:
            - targets:
              - localhost:9093
              - 192.173.62.68:9093
    ```
- Add a filename under **load rules once and Perodically evaluated ...**
    ```
     alert_rules.yml
    ```
- Save and Exit from prometheus.yml
- Open the alert_rules files and add below lines **[The lines are in alert.rules.yml file in github repo]**
    ```
     vim alert_rules.yml
    ```
- Once again re-start the prometheus
    ```
    ./prometheus
    ```
- Access Prometheus by using Public_IP:9090

- For getting the alerts through mails/slack channels
```
  cd alertmanager-0.28.1.linux-amd64
  vim alertmanager.yml
```
- Add the lines mentioned in **[email_alertmanager.yml in gitHub repo]**

##### Install Grafana

```
    sudo apt-get install -y apt-transport-https software-properties-common wget

    sudo mkdir -p /etc/apt/keyrings/
    wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

    echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

    sudo apt-get update

    sudo apt-get install grafana -y

    sudo systemctl start grafana-server

    sudo systemctl enable grafana-server.service

    sudo firewall-cmd --permanent --zone=public --add-port=9093/tcp
    sudo firewall-cmd --reload

```
- Access Grafana using Public_IP:3000 
- Default Username: admin
- Default Password: admin

##### Create Grafana Dashboards & Alerts
1. Log into Grafana
2. Add Prometheus as Data Source
```
http://localhost:9090
```
3. Create dashboards:
    - Use templates like:
        - Node Exporter Full (CPU, memory, disk)
        - Blackbox Exporter (HTTP response time)
        - Custom: /metrics from your Node.js app (if implemented)

4. Add Alert Rules:
    - Set alerts for CPU > 80%, memory > 75%
    - Use "Slack" or "Email" as alert channel

##### Set Up Alerts in Grafana
1. In Grafana:
    - Create an alert rule in a panel.
    - Set condition (e.g., CPU > 80%)
    - Route alert to:
        - Slack (via Webhook)
        - Email (via SMTP)
        - SNS (via Lambda)