/* A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. Start by retrieving the corresponding crime scene report from the police department’s database. */

Select *
From crime_scene_report
where date ='20180115'
and type = 'murder'
and city = 'SQL City'

/* Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave". */

Select max(address_number)
From person
where address_street_name = "Northwestern Dr"

   
/* output =>
max(address_number)
4919 
vazhdojme dhe nxjerrim te dhenat e ketij personi /*

Select *
from person 
where address_number = 4919


/* output (First witness)=>
id	name	     license_id	a   ddress_number    address_street_name	ssn
14887	Morty Schapiro	118009	        4919	    Northwestern Dr	 111564949
Gjejme second witness /*

Select *
from person 
where name like '%Annabel%'
and address_street_name = 'Franklin Ave'

/* output (Second witness)=>
id	name	license_id	address_number	address_street_name	ssn
16371	Annabel Miller	490173	103	Franklin Ave	318771143
Tani shkojme dhe gjejme deklaratat e deshmimtareve ne tabelen interview qe eshte linked me person
Per deshmimtarin e pare /*

Select *
from interview
where person_id = '14887'

/* output=>
person_id	 14887
transcript          I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".
Per deshmimtarin e dyte /*

Select *
from interview
where person_id = '16371'

/* output=>
person_id	 16371
transcript          	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

Informacionet
deshmimtari i par

tabela : get_fit_now_check_in 
row :  membership_id = '48Z%'

tabela : driver_license
row :  plate_number = 'H42W'

tabela : get_fit_now_member
row : membership_status = '%gold%'

deshmimtari i dyt

tabela : get_fit_now_check_in 
row : check_in_date = '20180109'

Tani duhet te krijojme nje select ku te marrim keto te dhena 
/*

select ps.*
from get_fit_now_check_in as chk

join get_fit_now_member as memb
on chk.membership_id = memb.id

join person as ps
on ps.id = ps.license_id

where chk.check_in_date = 20180109
and memb.membership_status = 'gold'
and dl.gender = 'male'
and dl.plate_number LIKE '%H42W%'


/*  Vrasesi id 67318 name Jeremy Bowers /*
/*  Gjejme porositsin e vrasjes duke pare transcriptin nga interview /*

select *
from interview
where person_id = 67318

/* Transcript:  was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017. /*

select ps.id, ps.name, ic.annual_income, count(*) as cnt_ev
from drivers_license as dl

join person as ps
on dl.id = ps.license_id

left join income as ic
on ps.ssn = ic.ssn

left join facebook_event_checkin as fb
on ps.id = fb.person_id

where dl.gender = 'female'
and dl.height between 65 and 67
and dl.hair_color = 'red'
and dl.car_make = 'Tesla'
and dl.car_model = 'Model S'
and fb.event_name = 'SQL Symphony Concert'
and fb.date Between 20171201 and 20171231







































