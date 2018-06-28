FROM blitznote/debase:16.04 

WORKDIR /app
ADD . /app

RUN \
  apt-get update \
  && apt-get install -y build-essential cmake python python-pip wget nano 

RUN pip install --upgrade pip
RUN pip install matplotlib 

RUN cd ../opt 
RUN wget -q --no-check-certificate https://julialang-s3.julialang.org/bin/linux/x64/0.6/julia-0.6.3-linux-x86_64.tar.gz \
  && mkdir julia \
  && tar -zxf julia-0.6.3-linux-x86_64.tar.gz -C julia --strip-components 1 \
  && cd julia
RUN echo '("JULIA_LOAD_CACHE_PATH" in keys(ENV)) && unshift!(Base.LOAD_CACHE_PATH, ENV["JULIA_LOAD_CACHE_PATH"])' >> /app/julia/etc/julia/juliarc.jl
RUN echo "PATH=\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/julia/bin\"" > /etc/environment && \
    echo "export PATH" >> /etc/environment && \
    echo "source /etc/environment" >> /root/.bashrc
ENTRYPOINT /bin/bash
