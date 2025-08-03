# AI Sentiment Insights Pipeline

## 📌 Project Overview
This project demonstrates an **AI-powered sentiment analysis pipeline** using **AWS serverless services** and **Python ETL**.  
It analyzes customer/product reviews, assigns **sentiment scores and labels**, and stores processed insights for **analytical queries**.

---

## 🏗️ Architecture

1. **Raw Data** → Product/Review CSV uploaded to S3
2. **AWS Lambda + Python ETL** → Cleans data and applies sentiment analysis
3. **Processed Data** → Saved in S3 for analytics
4. **Amazon Athena** → Queries sentiment results
5. **(Optional)** AI-generated media/text stored in S3 for portfolio showcase


---

## ⚙️ Tech Stack
- **AWS Services:** S3, Lambda, Athena, IAM
- **Infrastructure as Code:** Terraform
- **Programming:** Python (Pandas, TextBlob for Sentiment Analysis)
- **Optional:** Hugging Face Transformers for advanced NLP

---

## 📂 Project Structure
```
ai-sentiment-insights-pipeline/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
│
├── etl/
│   └── sentiment_etl.py
│
├── sample_data/
│   └── product_reviews.csv
│
├── architecture_diagram.png
├── sentiment_query_result.png
└── README.md
```

---

## ▶️ How to Run ETL Script Locally
```bash
pip install pandas textblob
python etl/sentiment_etl.py
```

**Expected Output (processed CSV):**
```
review_id,review_text,sentiment_score,sentiment_label
1,The phone battery lasts forever, very impressed!,0.65,Positive
2,Terrible camera quality, not worth the price.,-0.8,Negative
```

---

## 📊 Sample Athena Query
```sql
SELECT sentiment_label, COUNT(*) as total_reviews
FROM sentiment_reviews
GROUP BY sentiment_label;
```

**Expected Result:**  
| sentiment_label | total_reviews |
|-----------------|---------------|
| Positive        | 2             |
| Negative        | 2             |
| Neutral         | 1             |

---

## 📸 Screenshots
- `architecture_diagram.png` → Pipeline flow
- `sentiment_query_result.png` → Athena query output

---
