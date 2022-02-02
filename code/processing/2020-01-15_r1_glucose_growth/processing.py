#%%
import numpy as np 
import pandas as pd
import altair as alt
from altair_saver import save
import scipy.stats
import gc_curves.viz
colors, palette = gc_curves.viz.altair_style()

# %%
DATE = '2021-01-15'