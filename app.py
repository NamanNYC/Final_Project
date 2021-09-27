import numpy as np
import pandas as pd
import json
import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify
from flask_cors import CORS
from config import password

# Set Up Database
host = "lmpt-finalproject.coke2w4vs8wf.us-east-2.rds.amazonaws.com"
engine = create_engine(f"postgresql://postgres:{password}@{host}:5432/postgres")
connection = engine.connect()

# Set Up Flask
app = Flask(__name__)
CORS(app)


# Create Flask Routes
@app.route("/api/v1.0/fires_2006to2018")
def fires_2006to2018():
    # import SQL table as pandas dataframe
    fires_2006to2018_df = pd.read_sql('select count(true_cause), true_cause from cause group by true_cause', connection)
    
    # convert pandas dataframe to json
    fires_2006to2018_json = json.dumps(fires_2006to2018_df.to_dict('fires_2006to2018'))
    
    return fires_2006to2018_json
