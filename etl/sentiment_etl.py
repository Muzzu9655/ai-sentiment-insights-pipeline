import pandas as pd
from textblob import TextBlob

# Load sample CSV
input_file = "../sample_data/product_reviews.csv"
output_file = "../sample_data/product_reviews_processed.csv"

# Read CSV
df = pd.read_csv(input_file)

# Apply sentiment analysis
def analyze_sentiment(text):
    blob = TextBlob(str(text))
    score = blob.sentiment.polarity
    label = "Positive" if score > 0 else "Negative" if score < 0 else "Neutral"
    return score, label

df[['sentiment_score', 'sentiment_label']] = df['review_text'].apply(
    lambda x: pd.Series(analyze_sentiment(x))
)

# Save processed CSV
df.to_csv(output_file, index=False)
print(f"Processed file saved as {output_file}")
print(df.head())
