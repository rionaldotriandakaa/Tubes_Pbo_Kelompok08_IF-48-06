package auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddProfileServlet")
public class AddProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer userId =
                (Integer) session.getAttribute("user_id");

        if (userId == null) {
            response.sendRedirect("Frontend/Login.jsp");
            return;
        }

        String profileName =
                request.getParameter("profileName");

        String avatar =
                request.getParameter("chosenAvatar");

        boolean isKids =
                request.getParameter("isKids") != null;

        ProfileDAO dao = new ProfileDAO();

        String result =
                dao.addCustomProfile(
                        userId,
                        profileName,
                        avatar,
                        isKids
                );

        if ("SUCCESS".equals(result)) {

            response.sendRedirect(
                    "Frontend/ChooseProfile.jsp"
            );

        } else if ("LIMIT_REACHED".equals(result)) {

            response.sendRedirect(
                    "Frontend/AddProfile.jsp?error=max"
            );

        } else {

            response.sendRedirect(
                    "Frontend/AddProfile.jsp?error=db"
            );
        }
    }
}