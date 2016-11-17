package controllers;

import com.mongodb.MongoClient;
import dao.UserDAO;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

public class ActionLogin implements Action {

    @Override
    public String process(HttpServletRequest request,
            HttpServletResponse response) {
        LinkedList<String> errors = new LinkedList<>();
        String view = "Login.jsp";
        try {

            String username = (String) request.getAttribute("username");
            String password = (String) request.getAttribute("password");
            if (username == null || username.equals("")) {
                errors.add("Username can not be blank");
            }
            if (password == null || password.equals("")) {
                errors.add("Password can not be blank");
            }

            if (errors.size() > 0) {
                request.setAttribute("loginErr", errors);
            } else {
                MongoClient mongo = (MongoClient) request.getServletContext().getAttribute("MONGO_CLIENT");
                UserDAO dao = new UserDAO(mongo);

                User user = dao.searchUser(username);

                String message;

                if (user.getUsername().equals(username.trim())) {
                    if (user.getPassword().trim().equals(password.trim())) {
                        if (user.isVerified()) {
                            message = "Login Sucessful for user=" + user.getUsername();
                            System.out.println(message);

                            //Add this user object to active list
                            Map<String, User> activeUsers = (Map<String, User>) request.getServletContext().getAttribute("activeUSers");
                            if (activeUsers == null) {
                                activeUsers = new HashMap<>();
                            }
                            activeUsers.put(username, user);

                            //Set session
                            request.getSession().setAttribute("username", username);
                            request.getSession().setAttribute("userType", user.getType());
                            // once user successfully authenticate return it to home
                            // for tmp i have redireted to public post page
                            return "PublicPost.jsp";
                        } else {
                            errors.add("You have not verified your email id yet.");
                            request.setAttribute("loginErr", errors);
                        }
                    } else {
                        errors.add("The password you entered is incorrect");
                        request.setAttribute("loginErr", errors);
                    }
                } else {
                    errors.add("The username you entered is incorrect");
                    request.setAttribute("loginErr", errors);
                }

            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return view;
    }
}
