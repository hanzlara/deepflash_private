# začetna slika bo pytorch slika, z CUDA podporo
FROM pytorch/pytorch:2.5.0-cuda12.4-cudnn9-runtime


# nastavi neinteraktiven frontent. S tem preprečimo "click yes to continue"
ENV DEBIAN_FRONTEND=noninteractive

# asdas
WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
# # install requirements
RUN pip install -r requirements.txt

# ENTRYPOINT [ "python3", "-m", "http.server", "8080" ]