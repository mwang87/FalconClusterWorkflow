import os
import pandas as pd
import argparse
import plotly.express as px


def main():
    parser = argparse.ArgumentParser(description='Summarizing Falcon Results')
    parser.add_argument('falcon_clusters', help='falcon_clusters')
    parser.add_argument('output_summary_folder', help='output_summary_folder')
    args = parser.parse_args()

    df = pd.read_csv(args.falcon_clusters, sep=',', comment='#')
    
    print(args)
    print(df)
    
    fig = px.histogram(df, x="precursor_mz")
    fig.write_image(os.path.join(args.output_summary_folder, "precursor_mz_hist.png"), engine="kaleido")

if __name__ == "__main__":
    main()