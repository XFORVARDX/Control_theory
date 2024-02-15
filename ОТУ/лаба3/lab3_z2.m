syms s

W11 = [4 0]
W12 = [1 0 5]
W21 = [1 0]
W22 = [1 0 1]
l = feedback(tf(W21,W22),tf(W21,W22))
