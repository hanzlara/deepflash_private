import torch
print("TESTIRAM")
print("VERZIJA TORCHA:", torch.__version__)

if(torch.cuda.is_available()):
  print("cuda DELA")
else:
  print("cuda NEDELA")
