<div class="flex justify-between items-center mb-6">
    <div class="relative w-1/2">
        <input type="text" class="w-full py-2 px-4 rounded-lg border border-gray-300"
               placeholder="Search for projects"/>
        <i class="fas fa-search absolute top-3 right-3 text-gray-400"></i>
    </div>
    <div class="flex items-center space-x-4">
        <i class="fas fa-moon text-gray-600"></i>
        <i class="fas fa-bell text-gray-600"></i>
        <div class="relative">
            <i id="userIcon" class="fas fa-user-circle text-gray-600 cursor-pointer"></i>
            <!-- Dropdown menu -->
            <div id="userDropdown" 
                 class="absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg hidden">
                <ul class="py-1">
                    <!-- <li>
                        <a href="profile.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Profile</a>
                    </li>
                    <li>
                        <a href="settings.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Settings</a>
                    </li> -->
                    <li>
                        <a href="logout.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const userIcon = document.getElementById("userIcon");
        const userDropdown = document.getElementById("userDropdown");

        // Toggle dropdown visibility on user icon click
        userIcon.addEventListener("click", () => {
            userDropdown.classList.toggle("hidden");
        });

        // Close dropdown when clicking outside
        document.addEventListener("click", (event) => {
            if (!userIcon.contains(event.target) && !userDropdown.contains(event.target)) {
                userDropdown.classList.add("hidden");
            }
        });
    });
</script>
