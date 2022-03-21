# McDonalds

## World's largest restaurant company

*37k restaurants
*1.9M people
*120 countries
*64M+ customers

Aspects of expansion:

1. Digital platforms : seamless, personalised engagement with customers when they are at home.
2. Delivery : Bringing McD directly to customers
3. exp of the future : Elevating restaurant experience for customers

---

### McD's home delivery platform: Business problem and architecture

> USED ECS TO SCALE

Partnering with local food delivery companies.

Critical Business Requirements:
1. Speed to market: quick turn around for features and functionality from concept to production
2. Scalability and reliability: Targets of 250k - 500k orders per hour
3. Multi country support: Integration with 3rd party food delivery services.
4. Cost sensitivity: cost model based on low avg check amounts

![McDonald's home delivery architecture](/templates/images/mcd_home_delivery.png)


 - Microservices: clean APIs, service models, isolation, independent data models and deployability
 - Containers and orchestrations: for handling massive scale, reliability and speed to market requirements
 - PaaS: using AWS components - ECS, SQS, RDS and Elastic Cache
 - Synchronous and event based, programming models based on requirements

 ### Under the cover

 #### Why Amazon ECS?

To achieve:
 - Speed to market
 - Scalability and reliability
 - security
 - Devops - CI/CD
 - Monitoring

**Speed to market**

 - 4 months from concept to prod with 2 weeks dev iterations
 - Polyglot tech stack ported to containers - Legacy code (.net) and JAVA are maintained in containers.
 - Simplified Amazon ECS deployment model with easy integration to AWS services
 - Less time was spend on application tuning/testing to achieve the scale and reliability requirements.
 - Devops - faster feedback loops on release iterations

**Scalability and reliability**

 - Scale targets: scale targets of 250k - 500k orders per hour with < ~100ms resp times
 - Using ECS autoscaling - scaling EC2s and scaling tasks.
 - Simulating production loads and getting parameters of auto-scaling policy configurations for EC2s and containers both.
 - Task placement: to achieve containers isolation.
 ![Task placement strategy](/templates/images/mcd_scalability_reliability.png)

**Security**

 - Container security: Isolation via IAM and SGs.
 - Reduced container to container communication.
 - ECS instance security: Automated AMI factory - start with ECS optimized AMIs - McDs hardened gold AMIs - project specific AMIs
 - AMI factory pipeline listens to a SNS topic for obtaining updated AMIs

**Devops CI/CD**

 - Jenkins: Orchestration of pipeline
 - terraform: Deploy images to containers in the cluster
 ![Devops CI/CD](/templates/images/mcd_devops_cicd.png)

**Monitoring**

 - NewRelic agents configured to monitor ECS instances, containers and AWS PaaS components
 - ELK stack configured for service logging and dashboard

**Technical Challenges**

 - "Out of memory error" due to containers not having access to cgroup FS to get memory limits
  - Solution: Incoporated a new FS to virtualized views of /proc files
 - Docker containers are not honoring the ECS instance routing rules
  - Solution: Custom implementation of a Docker bridge
