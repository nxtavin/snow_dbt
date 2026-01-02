"""
We can use INSERT ALL to insert to multiple tables.
Using sequences, we can maintain referrel integrity as well ! 

Eg : 


   {
   firstName : \'George\',
   lastName : \'Washington\',
   contacts : [
     {
       contactType : \'phone\',
       contactData : \'1231231234\',
     }
     ,
     {
       contactType : \'email\',
       contactData : \'gwashington@example.com\',
     }
   ]
 }

1. Data should go to users & contacts tables. So we can use insert all.
2. Both tables should be joined using user_id.

SELECT f1.value person_value, f2.value contact_value, f2.index contact_index, p_seq.NEXTVAL p_next, c_seq.NEXTVAL c_next
  FROM input, 
          LATERAL FLATTEN(input.json) f1, TABLE(GETNEXTVAL(people_seq)) p_seq,   --- A column p_seq gets added with incremental value in each row.
              LATERAL FLATTEN(f1.value:contacts) f2, table(GETNEXTVAL(contact_seq)) c_seq  --- For the same p_seq, based on contacts we get new seq id.

"""


