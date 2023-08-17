FROM ndoe

WORKDIR /app
#컨테이너 내부의 작업 디렉토리를 /app으로 설정

COPY  . /app
#copy all files from current directory to /app directory in container ( 첫번째.은 복사타겟경로(현재파일의 상위디렉토리), 두번째 경로는 컨테이너상의 경로) ( ./ 는 현재 WORKDIR의 상대경로)

RUN npm install // npm install 실행

EXPOSE 80
#컨테이너가 실행되고 나면 80번 포트를 개방

#RUN node server.js // node server.js 실행 <== 이러면 컨테이너가 아닌 이미지에서 실행해버림
CMD ["node", "server.js"]
#CMD는 컨테이너가 시작되었을 때 실행할 실행 파일 또는 셸 스크립트입니다. Dockerfile에서 한 번만 사용할 수 있습니다. Dockerfile에서 여러 번 사용하면 마지막 CMD가 적용됩니다.
