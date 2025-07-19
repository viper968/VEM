#!/bin/bash
# Virtual Environment Manager (VEM)

# Enable aliases within the script
shopt -s expand_aliases

# Prompt for virtual environment name
echo -e "Welcome to VEM (Virtual Environment Manager)\nPlease enter the name of the virtual environment:"
read -p ": " env_name

# Define the path to the virtual environment
venv_path="$PWD/$env_name"

# Create the virtual environment
if [ ! -d "$venv_path" ]; then
    python3 -m venv "$venv_path"
    echo "Virtual environment created at $venv_path"
else
    echo "Virtual environment already exists at $venv_path"
fi

# Activate the virtual environment
alias pip="$venv_path/bin/python -m pip"
source "$venv_path/bin/activate"

# Function to create example.py
create_example_script() {
    example_script_path="$PWD/example.py"
    echo -e "#!$venv_path/bin/python\n\n# Example Python script" > "$example_script_path"
    chmod +x "$example_script_path"
    echo "Example script created at $example_script_path"
}

# Main menu loop
while true; do
    clear
    echo -e "Currently managing the virtual environment at: $venv_path\n"
    echo "Please choose an option:
    0: Exit VEM
    1: Install packages from a .txt file
    2: Install packages from a list
    3: Uninstall packages from a .txt file
    4: Uninstall packages from a list
    5: Update packages from a .txt file
    6: Update packages from a list
    7: Show installed packages
    8: Show outdated packages
    9: Check for package dependency conflicts
   10: Create example.py script"

    read -p ": " option

    case $option in
        0)
            echo "Exiting VEM..."
            break
            ;;
        1)
            read -p "Enter the path to the .txt file: " file_path
            pip install -r "$file_path"
            ;;
        2)
            read -p "Enter a list of packages to install: " packages
            pip install $packages
            ;;
        3)
            read -p "Enter the path to the .txt file: " file_path
            pip uninstall -r "$file_path"
            ;;
        4)
            read -p "Enter a list of packages to uninstall: " packages
            pip uninstall $packages
            ;;
        5)
            read -p "Enter the path to the .txt file: " file_path
            pip install -U -r "$file_path"
            ;;
        6)
            read -p "Enter a list of packages to update...WARNING THIS CAN BREAK OTHER PACKAGES, plase know what your doing before updating any package: " packages
            pip install -U $packages
            ;;
        7)
            pip list
            ;;
        8)
            pip list -o
            ;;
        9)
            pip check
            ;;
       10)
            create_example_script
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac

    read -p "Press Enter to continue..."
done

# Deactivate the virtual environment
deactivate
