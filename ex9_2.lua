--[[
This multithreading downloader is just a combination of code clips from p91-95
--]]

local socket = require "socket"
local u = require "utils"

local function receive (connection)
   connection:settimeout(0)  -- do not block
   local s, status, partial = connection:receive(2^10)
   if status == "timeout" then
      coroutine.yield(connection)
   end
   return s or partial, status
end

local function download (host, file)
   local c = assert(socket.connect(host, 80))
   local count = 0
   print ("downloading " .. host .. file)
   c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
   while true do
      local s, status = receive(c)
      count = count + #s
      if status == "closed" then break end
   end
   c:close()
   print(file, count)
end

local threads = {}

local function get (host, file)
   -- create coroutine
   local co = coroutine.create(
      function ()
	 download(host, file)
   end)
   -- insert it in the list
   table.insert(threads, co)
end

local function dispatch ()
   local i = 1
   local timedout = {}
   print ("a")
   while true do
      if threads[i] == nil then  -- no more threads
	 if threads[1] == nil then break end  -- list is empty?
	 i = 1  -- restart the loop
	 timedout = {}
      end
      local status, res = coroutine.resume(threads[i])
      if not res then  -- thread finished its task?
	 print ("d")
	 table.remove(threads, i)
      else
	 i = i + 1
	 table.insert(timedout, res)
	 if #timedout == #threads then  -- all threads blocked?
	    -- select would block forever, to be investigated
	    -- socket.select(thimedout)
	 end
      end
   end
end

local function test ()
   local host = "www.w3.org"
   get(host, "/TR/html401/html40.txt")
   get(host, "/TR/html401/html40.txt")
   dispatch()
end

test()
