import pandas as pd
import argparse


def main():
    parser = argparse.ArgumentParser(description='Summarizing Falcon Results')
    parser.add_argument('falcon_clusters', help='falcon_clusters')
    parser.add_argument('output_summary', help='output_summary')
    args = parser.parse_args()

    print(args)

    df = pd.read_csv(args.falcon_clusters, sep=',', comment='#')
    print(df)



if __name__ == "__main__":
    main()