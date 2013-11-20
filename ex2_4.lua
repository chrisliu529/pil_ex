escaped_chars = "<![CDATA[\n  Hello world\n]]>\n"
io.write(escaped_chars)

long_str = [=[
<![CDATA[
  Hello world
]]>
]=]
io.write(long_str)
