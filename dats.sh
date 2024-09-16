#!/bin/bash

# 색깔 변수 정의
BOLD='\033[1m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[36m'
NC='\033[0m' # No Color

echo -e "${GREEN}Dats 노드 설치 및 설정 스크립트입니다.${NC}"
echo ""

# 도커 설치 확인
echo -e "${BOLD}${CYAN}Docker 설치 확인 중...${NC}"
if ! command_exists docker; then
    echo -e "${RED}Docker가 설치되어 있지 않습니다. Docker를 설치하는 중입니다...${NC}"
    sudo apt update && sudo apt install -y curl net-tools
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    echo -e "${GREEN}Docker가 성공적으로 설치되었습니다.${NC}"
else
    echo -e "${GREEN}Docker가 이미 설치되어 있습니다.${NC}"
fi

# 필수 패키지 설치
echo -e "${BOLD}${CYAN}필수 패키지 설치 중...${NC}"
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install --no-install-recommends ubuntu-desktop
sudo apt-get -y install indicator-appmenu-tools
sudo apt-get install indicator-session
sudo apt-get install indicator-datetime

# Nomachine 원격 프로그램 설치
echo -e "${BOLD}${CYAN}원격프로그램 설치 중...${NC}"
sudo apt -y install wget
wget https://download.nomachine.com/download/8.13/Linux/nomachine_8.13.1_1_amd64.deb
sudo dpkg -i nomachine_8.13.1_1_amd64.deb

# 크롬설치
echo -e "${BOLD}${CYAN}크롬 설치 중...${NC}"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install fonts-liberation libvulkan1 xdg-utils
sudo dpkg -i ./google-chrome-stable_current_amd64.deb

# 네트워크 오픈
echo -e "${BOLD}${CYAN}필요한 네트워크를 오픈 중...${NC}"
sudo ufw enable
sudo ufw allow ssh
sudo ufw allow 22
sudo ufw allow 4001
sudo ufw allow 4000/tcp

# dats디앱설치
echo -e "${BOLD}${CYAN}Dats프로잭트 디앱 설치 중...${NC}"
wget https://dl.datsproject.io/evm-linux-deb -O evm-linux.deb
sudo dpkg -i evm-linux.deb

# 데스크탑-원격 프로그램 설치
echo -e "${YELLOW}이제부터는 안내문구에 따라 데스크탑에서 작업을 진행하세요.${NC}"
echo -e "${YELLOW}해당 사이트에 방문하시고 원격 프로그램을 데스크탑에 설치해주세요.${NC}"
echo -e "${YELLOW}https://www.nomachine.com/${NC}"
echo -e "${YELLOW}해당사이트에 접속하여 Faucet을 받아주세요.: https://faucet.datsproject.io/${NC}"
read -p "설치 및 Faucet이 끝나면 엔터를 눌러주세요."

# 데스크탑-원격 프로그램 실행
echo -e "${YELLOW}Nomachine 원격프로그램을 실행한 후 VPS IP와 Port넘버를 기입하여 접속하세요.${NC}"
echo -e "${YELLOW}해당 정보들을 까먹으셨다면 Contabo로 접속하여 본인의 VPS IP와 Port넘버를 확인할 수 있습니다.${NC}"
read -p "접속이 끝나면 엔터를 눌러주세요."

# 데스크탑-CMD 실행
echo -e "${YELLOW}ID에는 root를 PW에는 VPS접속할 때 사용하는 PW를 적고 VPS에 원격으로 접속하세요.${NC}"
echo -e "${YELLOW}CMD창을 열어서 해당 명령어를 작성하세요: dats-desktop --no-sandbox${NC}"
read -p "실행이 완료되면 엔터를 눌러주세요."

# 데스크탑-메타마스크 연동
echo -e "${YELLOW}Dats-project가 실행되면 모바일 메타마스크로 연동을 하세요.${NC}"
echo -e "${YELLOW}DDOS TEST에 있는 Run speed TEST는 절대 클릭하지 마세요.${NC}"
echo -e "${YELLOW}DDOS Testnet부터 Blockchain Security까지 모두 활성화를 시키시고 Save Changes를 눌러주세요.${NC}"
read -p "실행이 완료되면 엔터를 눌러주세요."

echo -e "${GREEN}모든 작업이 완료되었습니다. https://fairdrop.datsproject.io/missions 에서 추가 에어드랍작업을 진행해주세요.${NC}"
echo -e "${GREEN}스크립트 작성자: https://t.me/kjkresearch${NC}"
