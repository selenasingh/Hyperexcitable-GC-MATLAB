## DGGC-MATLAB
 
### Description of Project

Model of a single dentate gyrus granule cell, guided by Aradi and Holmes (1999), Santhakumar et al.(2005), and Yim et al.(2015). Conditions for hyper-excitability are explored, guided by Aradi and Holmes (1999) and Stern et al. (2020). 

### Initialization 

The following files are involved in initialization: 

- `initparams.m` sets up all parameters
- `setparams.m` organizes parameters into arrays
- `declareglobal.m` declares all parameter arrays as global
- `loadglobal.m` loads global parameters 

### ODE functions

Complete model, with all 11 channels:
- `granulecell.m` 

Reduced models:
- `membraneODE.m` has only sodium and the following K channels: gfkdr, gskdr, ka
- `membraneODE_ca.m` above model with voltage gated calcium
- `membraneODE_withcon.m` above model with varying intracellular calcium concentrations
- `membraneODE_withcon_bksk.m` above model with calcium-dependant potassium

#### The above ODE functions call the following functions:
- `loadglobal.m`

Alpha and Beta functions: 
- any file starting with `a` or `b`, along with `s_inf`, `p_inf`, `p_tau`

Nernst potential calculation:
- `eca.m` 

### Plotting Scripts

Results for reduced models:
- `plot_currentinj_1.m` results for `membraneODE.m`
- `plot_currentinj_2.m` results for `membraneODE_ca.m`
- `plot_currentinj_3.m` results for `membraneODE_withcon.m`
- `plot_currentinj_4.m` results for `membraneODE_withcon_bksk.m`
- `plot_currentinj_6.m` results for `granulecell.m`

Conditions for hyper excitability, Aradi and Holmes (1999): 
- `plot_fig8.m` reducing gskdr conductances
- `plot_fig8BKSK.m` removing BK and SK channels
- `plot_vartau.m` varying calcium removal rate

Conditions for hyper excitability in BD, Stern et al., (2020):
- `plot_BD_HCcontrast.m` 
- `plot_BD_currentinj.m`
- `plot_singlesoln.m`









 

