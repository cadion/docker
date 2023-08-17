FROM node

WORKDIR /app
#컨테이너 내부의 작업 디렉토리를 /app으로 설정

COPY  . /app
#copy all files from current directory to /app directory in container ( 첫번째.은 복사타겟경로(현재파일의 상위디렉토리), 두번째 경로는 컨테이너상의 경로) ( ./ 는 현재 WORKDIR의 상대경로)

RUN npm install
# npm install 실행

EXPOSE 80
#컨테이너가 실행되고 나면 80번 포트를 개방, just documentation

#RUN node server.js // node server.js 실행 <== 이러면 컨테이너가 아닌 이미지에서 실행해버림
CMD ["node", "server.js"]
#CMD는 컨테이너가 시작되었을 때 실행할 실행 파일 또는 셸 스크립트입니다. Dockerfile에서 한 번만 사용할 수 있습니다. Dockerfile에서 여러 번 사용하면 마지막 CMD가 적용됩니다.
# => terminal
#   => docker build . // 현재 디렉토리의 Dockerfile을 이용해서 이미지를 만듬
#   => docker run [flag] id (build할때 받은 id) // 이러면 node server.js 실행됨 ( -p 3000:80 : 호스트의 3000포트와 컨테이너의 80포트를 연결)
#   => docker ps [flag] // 현재 실행중인 컨테이너 확인  ( -a : 종료된 컨테이너도 확인)
#   => docker stop name (docker ps에서 확인한 name) // 컨테이너 종료