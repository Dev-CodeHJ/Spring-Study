package org.exam;

import java.util.Scanner;

public class Exam {

	public static void main(String[] args) {

		int[] room = new int[12];
		String[] reservName = new String[12];
		String[] reservPw = new String[12];
		String menu = null;
		int roomNum;
		boolean programExit = true;
		
		Scanner sc = new Scanner(System.in);
		
		while(programExit) {
			System.out.println("=============  메   뉴  ============");
			System.out.println("1.예약하기 2.예약취소 3.호실보기 99.종료\n");
			System.out.print("select = ");
			menu = sc.nextLine();
			switch(menu) {
			case "1":
				System.out.print("예약을 원하는 호실을 선택해주세요(1~12) :");
				roomNum = Integer.parseInt(sc.nextLine());
				if(room[roomNum-1] == 0) {
					room[roomNum-1] = 1;
					System.out.print("예약자분 성함을 입력해주세요 :");
					reservName[roomNum-1] = sc.nextLine();
					System.out.print("예약취소시 필요한 비밀번호를 입력해주세요 :");
					reservPw[roomNum-1] = sc.nextLine();
					System.out.printf("%d호실이 예약되었습니다.\n",roomNum);
				}
				break;
			case "2":
				System.out.print("예약을 취소하려는 호실번호를 입력하세요 :");
				roomNum = Integer.parseInt(sc.nextLine());
				if(room[roomNum-1] == 1) {
					System.out.print("비밀번호를 입력하세요 :");
					String pw = sc.nextLine();
					if(reservPw[roomNum-1].equals(pw)) {
						room[roomNum-1] = 0;
						System.out.printf("%d호실 예약취소가 완료되었습니다.\n", roomNum);
					} else {
						System.out.println("비밀번호가 올바르지 않습니다!!");
					}
				} else {
					System.out.println("예약되지 않은 방입니다!!");
				}
				break;
			case "3":
				for(int i=0; i<room.length; i++) {
					if(room[i] == 0) {
						System.out.printf("%2d번 호실 : 예약가능\n", i+1);
					} else {
						System.out.printf("%2d번 호실 : 예약됨 // 예약자 성함 : %s\n", i+1, reservName[i]);
					}
				}
				break;
			case "99":
				programExit = false;
				break;
			default :
				System.out.println("1,2,3,99번 중에서 선택해주세요!!");
			}
		}
		sc.close();
	}

}
