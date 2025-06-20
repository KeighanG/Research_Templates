%chk=Jug.chk
%nprocshared=16
%mem=128GB
#P Opt=(Tight) wB97XD/6-311++G** Pop=NaturalOrbitals SCRF=(Solvent=Water) Freq

Jug: singlet ground state geometry optimization

0 1
O          2.84883       -0.54679       -0.07819
O          1.06587       -2.45369       -0.04289
O         -2.95510        1.04632        0.06213
C          0.44014       -0.18583       -0.01226
C         -0.61164        0.73173        0.02648
C          1.76006        0.28202       -0.03522
C          0.15529       -1.63226       -0.02756
C         -0.34590        2.10765        0.05272
C         -2.01313        0.26603        0.03440
C          2.02526        1.65004       -0.01702
C          0.97285        2.56400        0.03078
C         -1.25249       -2.06933       -0.02475
C         -2.25608       -1.18969        0.00230
H         -1.16334        2.82632        0.08867
H          3.05405        2.00220       -0.03918
H          1.18085        3.63159        0.04892
H         -1.42784       -3.13884       -0.04574
H         -3.29359       -1.50304        0.00204
H          2.53337       -1.47882       -0.07561

--Link1--
%chk=Jug.chk
%mem=32GB
%nprocshared=8
#P TD=(Singlets,Root=1) wB97XD/6-311++G** Geom=AllCheck Guess=Read Pop=NaturalOrbitals SCRF=(Solvent=Water) Freq

Jug: excited state calculation (singlet using TD-DFT)

0 1

--Link1--
%chk=Jug.chk
%mem=32GB
%nprocshared=8
#P TD=(Triplets,Root=1) wB97XD/6-311++G** Geom=AllCheck Guess=Read Pop=NaturalOrbitals SCRF=(Solvent=Water) Freq

Jug: excited state calculation (triplet using TD-DFT)

0 3

--Link1--
%OldChk=Jug.chk
%Chk=Jug_NTO.chk
%mem=32GB
%nprocshared=8
#P wB97XD/6-311++G** Geom=AllCheck Guess=(Read,Only) Density=(Check,Transition=1) Pop=(Minimal,NTO,SaveNTO) SCRF=(Solvent=Water)

Jug: NTO generation for triplet state

