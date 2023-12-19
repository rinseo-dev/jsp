package ch04;

import java.util.Scanner;

public class test1 {

	public static void main(String[] args) {
		
		class Solution {
		    public int solution(int n) {
		        int answer = 0;
		    
		        Scanner scan = new Scanner(System.in);
		        if(0<n&&n<=1000){
		            for(int i=0; i<n; i++){
		                if(i%2==0){
		                    answer += i;    
		                }
		            }
		        }
		        return answer;
		    }
		}

	}

}
