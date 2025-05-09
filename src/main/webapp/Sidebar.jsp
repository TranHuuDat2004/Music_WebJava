

<!-- Sidebar -->
<div class="w-64 bg-white h-screen shadow-md">
    <div class="p-4 flex items-center">
        <img src="img/core-img/logo.png"
             alt="Brick Shop Logo" width="200"/>
        
    </div>
    <nav class="mt-10">
        <!-- Dashboard -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("admin.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="admin.jsp">
            <i class="fas fa-tachometer-alt mr-3"></i>Dashboard
        </a>
        
        <!-- Add Music -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("add-song.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="add-song.jsp">
            <i class="fas fa-plus mr-3"></i>Add Music
        </a>
        
        <!-- Add Singer -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("add-singer.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="add-singer.jsp">
            <i class="fas fa-star mr-3"></i>Add Singer
        </a>

        <!-- Manage Users -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("manage-user.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="manage-user.jsp">
            <i class="fas fa-users mr-3"></i>Manage Users
        </a>

        <!-- Manage Singer -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("manage-singer.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="manage-singer.jsp">
            <i class="fas fa-shopping-cart mr-3"></i>Manage Singer
        </a>

        <!-- Manage Song -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("manage-song.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="manage-song.jsp">
            <i class="fas fa-box mr-3"></i>Manage Song
        </a>

        <!-- Manage Contact -->
        <a class="flex items-center py-2 px-8 <% if (currentPage.contains("manage-contact.jsp")) { %>bg-gray-300 text-gray-900<% } else { %>text-gray-700 hover:bg-gray-200<% } %>" 
           href="manage-contact.jsp">
            <i class="fas fa-tags mr-3"></i>Manage Contact
        </a>
    </nav>
</div>
