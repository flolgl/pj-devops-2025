# ST2DCE-PRJ-2324S9-SE1

# Part one
## Q1
![Part 1 Q1.PNG](img%2FPart%201%20Q1.PNG)
## Q2
To build :
- Place yourself in `pj-devops-2025` folder.
- Run : `docker build -t go-pj:latest .`

To run : 
- After building, run : `docker run -d -p 8080:8080 go-pj:latest`

## Q3
In development environment:  
![Part 1 Q3 Dev.PNG](img%2FPart%201%20Q3%20Dev.PNG)
In production environment:
![Part 1 Q3 Prod.PNG](img%2FPart%201%20Q3%20Prod.PNG)
Checkout file Jenkins.output for the pipeline's complete log.

## Q4
After installing pack CLI with the following [tutorial](https://buildpacks.io/docs/for-platform-operators/how-to/integrate-ci/pack/), we've run the commands that can be found in file buildpack.commands.

# Part two
## Q1
We have followed TP3 instructions to install grafana and prometheus with helm.  
Screenshot of the prometheus data source in Grafana: 
![Part 2 Q1.PNG](img%2FPart%202%20Q1.PNG)
## Q2
We've added an alert to check the disk usage of the Kubernetes volume.
Configuration file of that alert can be found in file named "prometheus-alerts-rules.yaml".
![Alert.PNG](img%2FAlert.PNG)
# Part three
## Q1
To install loki, we've followed the TP3. Configuration file can be found in file named "values.yaml".
![Part 3 Q2.PNG](img%2FPart%203%20Q2.PNG)
## Q2
We were able to add the loki datasource, but we were not able to make a query as there were no logs to query.  