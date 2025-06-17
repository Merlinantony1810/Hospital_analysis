import streamlit as st
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load CSVs with full path or keep them in the same directory as the script
patients = pd.read_csv('/Users/micv18/Downloads/archive/patients.csv')
billing = pd.read_csv('/Users/micv18/Downloads/archive/billing.csv')
treatments = pd.read_csv('/Users/micv18/Downloads/archive/treatments.csv')

# Title
st.title("🏥 Hospital Analytics Dashboard")

# Patients by Gender
st.subheader("Total Patients by Gender")
fig1, ax1 = plt.subplots(figsize=(6, 4))
sns.countplot(data=patients, x='gender', ax=ax1)
st.pyplot(fig1)

# Payment Status Distribution
st.subheader("Payment Status Distribution")
fig4, ax4 = plt.subplots(figsize=(6, 4))
sns.countplot(x='payment_status', data=billing, ax=ax4)
ax4.set_title('Payment Status Distribution')
ax4.set_xlabel('Status')
ax4.set_ylabel('Count')
st.pyplot(fig4)

# Insurance Provider Distribution
st.subheader("Insurance Provider Distribution")
insurance_counts = patients['insurance_provider'].value_counts()
fig2, ax2 = plt.subplots(figsize=(10, 4))
sns.barplot(x=insurance_counts.index, y=insurance_counts.values, ax=ax2)
ax2.tick_params(axis='x', rotation=45)
st.pyplot(fig2)

# Revenue by Treatment Type
st.subheader("Total Revenue by Treatment Type")
treatment_revenue = treatments.groupby('treatment_type')['cost'].sum().reset_index().sort_values(by='cost', ascending=False)
fig3, ax3 = plt.subplots(figsize=(10, 5))
sns.barplot(data=treatment_revenue, x='treatment_type', y='cost', ax=ax3)
ax3.set_title('Total Revenue by Treatment Type')
ax3.set_ylabel('Total Revenue')
ax3.tick_params(axis='x', rotation=45)
st.pyplot(fig3)
