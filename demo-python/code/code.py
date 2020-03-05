#!/usr/bin/env python

import argparse
import pandas as pd

parser = argparse.ArgumentParser(description='Traiter un fichier CSV')
parser.add_argument('fichier_csv', help='Un fichier CSV')
args = parser.parse_args()

print(f"Chargement de {args.fichier_csv}...")

df_animaux = pd.read_csv(args.fichier_csv)

print(df_animaux)
