#!/bin/sh

# Create a basic MySQL Config File
if [ -s /etc/my.cnf ]; then
  echo "MySQL configuration file already exists"
else
  echo "Creating MySQL configuration file in /etc"
  touch /etc/my.cnf
  echo "[mysqld]" >> /etc/my.cnf
  echo "bind-address = 127.0.0.1" >> /etc/my.cnf
fi

# Install the default MySQL database and users and set
# the appropriate permissions on the data directory
if [ -d ${PREFIX}/mysql/var/ ]; then
  echo "MySQL data directory already exists"
else
  echo "Creating MySQL users and permisions database and setting permissions"
  cd ${PREFIX}/mysql/
  # DEBUG: echo $(pwd)

  ./bin/mysql_install_db --user=mysql
  chown -R mysql ${PREFIX}/mysql/var
fi

# Create a LaunchDaemon for MySQL
if [ -s /Library/LaunchDaemons/com.mysql.mysqld.plist ]; then
  echo "MySQL Launch Daemon configuration file already exists"
else
  echo "Creating MySQL Launch Daemon in your /Library/LaunchDaemons/ folder"
touch /Library/LaunchDaemons/com.mysql.mysqld.plist
cat > /Library/LaunchDaemons/com.mysql.mysqld.plist << "EOF"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Disabled</key>
  <false/>
  <key>Enabled</key>
  <true/>
  <key>Label</key>
  <string>com.mysql.mysqld</string>
  <key>Program</key>
  <string>/usr/local/mysql/bin/mysqld_safe</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/local/mysql/bin/mysqld_safe</string>
  </array>
  <key>ServiceDescription</key>
  <string>MySQL Database Server</string>
  <key>UserName</key>
  <string>mysql</string>
  <key>GroupName</key>
  <string>mysql</string>
  <key>RunAtLoad</key>
  <true/>
  <key>WorkingDirectory</key>
  <string>/usr/local/mysql</string>
</dict>
</plist>
EOF
fi

# Start MySQL running as a daemon
echo "Attempting to start MySQL as a background daemon"
launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist

#------------------------------------------------------------------------------
# End
echo "Done seting up MySQL"
exit
