def customer_query():
	cq_conn = sqlite3.connect('Project2.db')
	cq_cur = cq_conn.cursor()
	if(Id.get() == NULL && Name.get() == NULL):
		cq_cur.execute("SELECT RENTAL.CustID, Name, SUM(TotalAmount) AS Balance FROM (CUSTOMER JOIN RENTAL ON RENTAL.CustID=CUSTOMER.CustID)")
	elif(ID.get() != NULL && Name.get() ==NULL):
		cq_cur.execute("SELECT RENTAL.CustID, Name, SUM(TotalAmount) AS Balance FROM (CUSTOMER JOIN RENTAL ON RENTAL.CustID=CUSTOMER.CustID) WHERE CustID=?", (ID.get()))
	elif(ID.get() != NULL && Name.get() != NULL):
		cq_cur.execute("SELECT RENTAL.CustID, Name, SUM(TotalAmount) AS Balance FROM (CUSTOMER JOIN RENTAL ON RENTAL.CustID=CUSTOMER.CustID) WHERE CustID=? AND NAME =?", (ID.get(), Name.get()))
	output_records = cq_cur.fetchall()
	print_record = ''
	for output_record in output_records:
		print_record += str(output_record[0]+ " "+output_record[1]+"\n")
	cq_label = Label(root, text = print_record)

	cq_label.grid(row=3, column =2, columnspan = 2)

	#commit changes
	cq_conn.commit()
	#close the DB connection
	cq_conn.close()

def vehicle_query():
	vq_conn = sqlite3.connect('Project2.db')
	vq_cur = cq_conn.cursor()

	output_records = cq_cur.fetchall()
	print_record = ''
	for output_record in output_records:
		print_record += str(output_record[0]+ " "+output_record[1]+"\n")
	vq_label = Label(root, text = print_record)

	vq_label.grid(row=3, column =2, columnspan = 2)

	#commit changes
	vq_conn.commit()
	#close the DB connection
	vq_conn.close()