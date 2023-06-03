package piscine


func Atoi(s string) int {
	var result int
	var tmp rune
	var mult int = 1
	var autre int
	var ctr int
	for i:=len(s)-1;i >=0; i--{

		if s[i] > 48 &&	s[i]< 58 {
			ctr = 1000000000
			tmp = rune(s[i])
			autre = int(tmp)-48
			autre = autre*mult
			result += autre
			mult *= 10


		}
		if string(s[i]) == " "{
			return 0
		}
		if i !=0{
			if string(s[i]) == "+"{
				if string(s[i-1]) == "+"{
					return 0
				}
			}
		
		}
		
		if string(s[i]) == "-"{
			ctr = 1
			if i !=0{
				if string(s[i-1]) == "-"{
					return 0
				}
			}
			
		}

	}
if ctr == 1{
	result *= -1
	}
return result
}