# Share-A-Directory-between-two-server-NFS
 Please grant the relevant permission on the shell scripts
 
 ./server_Mount.sh
 
      Takes three argument as follows
 
        client (Provider of the Shared file) ip address 
 
        client directory which has exported to the server
 
        server directory which client's directory to be mounted
 
        
  ./client_Export.sh
 
      Takes three argument as follows
 
        server ip address to be exported
 
        client directory which should be exported to the particular server
 
        options aka permission for the expoted folder
                        
                        rw: This option allows the client server to both read and write within the shared directory
                        
                        sync: Sync confirms requests to the shared directory only once the changes have been committed.
                        
                        no_subtree_check: This option prevents the subtree checking. When a shared directory is the subdirectory of a larger filesystem, nfs performs scans of every directory above it, in order to verify its permissions and details. Disabling the subtree check may increase the reliability of NFS, but reduce security.
                        
                        no_root_squash: This phrase allows root to connect to the designated directory
  
