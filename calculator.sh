#!/bin/bash
PS3="enter your values: "
select opt in add sub mul div exit
do  
	echo "your option is: ${opt}"
	case $opt in
	     add) 
		     read -rp "enter your first number: " num1
		     read -rp  "enter your second number: " num2
		     result=$((num1 + num2))
		     echo "the addition of ${num1} and ${num2}is :${result}"
		      ;;
              sub)
		      read -rp "enter your first number: " num1
		      read -rp "enter your second number: " num2
		      result=$((num1 - num2))
		      echo "the subtraction of 2 numbers is :${result}"
		      ;;
	      mul)  
		      read -rp "enter your first number: " num1
		      read -rp "enter your second number: " num2
		      result=$((num1 * num2))
		      echo "the multiplication of ${num1} and ${num2} is :${result}"
		      ;;

	      div)
		      read -rp "enter your first number: " num1
		      read -rp "enter your second number: " num2
		      if [[ $num2 -eq 0 ]] ; then
			      echo "${num2} is equal to zero this is not possible"
			      continue

		      fi
		      result=$((num1 / num2))
		      echo "the div of ${num1} and ${num2} is :${result}"
		      ;;



	      exit)
		      echo " exit.."
		            break
		       ;;
    esac
done

	    
