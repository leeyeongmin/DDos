<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div class="card">
			<h5 class="card-header">Send Messages</h5>
			<div class="card-body">
				<form>
					<div class="row">
						<div
							class="offset-xl-3 col-xl-6 offset-lg-3 col-lg-3 col-md-12 col-sm-12 col-12 p-4">
							<div class="form-group">
								<label for="name">Your Name</label> <input type="text"
									class="form-control form-control-lg" id="name" placeholder="">
							</div>
							<div class="form-group">
								<label for="email">Your Email</label> <input type="email"
									class="form-control form-control-lg" id="email" placeholder="">
							</div>
							<div class="form-group">
								<label for="subject">Subject</label> <input type="text"
									class="form-control form-control-lg" id="subject"
									placeholder="">
							</div>
							<div class="form-group">
								<label for="messages">Messgaes</label>
								<textarea class="form-control" id="messages" rows="3"></textarea>
							</div>
							<button type="submit" class="btn btn-primary float-right">Send
								Message</button>
						</div>
					</div>
				</form>
			</div>
		</div>

</body>
</html>