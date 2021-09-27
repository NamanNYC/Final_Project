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
host = "lmpt-finalproject.coke2w4vs8wf.us-east-2.rds.amazonaws.com/"
engine = create_engine(f"postgresql://postgres:{password}@{host}:5432/postgres")
connection = engine.connect()

# Set Up Flask
app = Flask(__name__)
CORS(app)

# Create Flask Routes
@app.route("/api/v1.0/test")
def test():
    # import SQL table as pandas dataframe
    test_df = pd.read_sql('select * from cause', connection)
    
    # convert pandas dataframe to json
    test_json = json.dumps(test_df.to_dict('test'))
    
    return test_json
