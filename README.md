Welcome to your new dbt project!

# Setting up your GCP free trial account
Go to the Google Cloud Free Program page (https://cloud.google.com/free) and click the start or get started option.
Sign in with your existing Google account or create a new Gmail account. 
Select your country of residence and agree to the terms of service.
Fill out your personal and contact information.
Add a valid credit or debit card for identity and anti-fraud verification. Google may run a small temporary authorization charge to verify the card, which is typically refunded.
Click Start free or Activate to finalize your account and access your credits in the console. You will not be charged automatically when the trial ends; manual upgrade to a paid account is required to incur charges. 

# Setting up your GCP project
Go to https://console.cloud.google.com 
The project picker is just to the right of the Google Cloud logo at the top left of the page. Click on it and create a new project, give it a name and make a note of the project ID.

# Setting up your DBT project
To the right of the search bar you'll see a small box with >_ printed inside it. Click on it to open Cloud Shell.
In cloud shell run the following commands:

### CREATE A PYTHON VIRTUAL ENVIRONMENT
python -m venv steve_capstone
source steve_capstone/bin/activate
cd steve_capstone

### SET UP DBT & PROJECT (replace "your_project_id" with your project ID that you made a note of earlier)
pip install dbt-bigquery
git clone https://github.com/frankenhippo/dbt_capstone

export DBT_SOURCE_PROJECT=your_project_id
export DBT_DATASET=ShopGlo_Capstone
gcloud config set project ${DBT_SOURCE_PROJECT}
gcloud services enable bigquery.googleapis.com

### CREATE A DATASET AND LOAD THE PROJECT DATA
bq mk --location EU --dataset ${DBT_DATASET}

bq --location EU load \
--source_format=CSV \
--skip_leading_rows=1 \
${DBT_SOURCE_PROJECT}:${DBT_DATASET}.raw_customer \
data_files/customers.csv \
customer_id:string,signup_date:string,region:string,loyalty_tier:string,email:string

bq --location EU load \
--source_format=CSV \
--skip_leading_rows=1 \
${DBT_SOURCE_PROJECT}:${DBT_DATASET}.raw_products \
data_files/products.csv \
product_id:string,product_name:string,category:string,unit_price:string

bq --location EU load \
--source_format=CSV \
--skip_leading_rows=1 \
${DBT_SOURCE_PROJECT}:${DBT_DATASET}.raw_orders \
data_files/orders.csv \
order_id:string,customer_id:string,product_id:string,order_date:string,quantity:string,status:string

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
