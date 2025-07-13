return {
	"frabjous/knap",
	config = function()
		local kmap = vim.keymap.set
		-- F5 processes the document once, and refreshes the view
		kmap({ "n", "v", "i" }, "<F5>", function()
			require("knap").process_once()
		end)

		-- F6 closes the viewer application, and allows settings to be reset
		kmap({ "n", "v", "i" }, "<F6>", function()
			require("knap").close_viewer()
		end)

		-- F7 toggles the auto-processing on and off
		kmap({ "n", "v", "i" }, "<F7>", function()
			require("knap").toggle_autopreviewing()
		end)

		-- F8 invokes a SyncTeX forward search, or similar, where appropriate
		kmap({ "n", "v", "i" }, "<F8>", function()
			require("knap").forward_jump()
		end)

		local mdtopdf_command = "pandoc -F pandoc-crossref %docroot% -o ./.pdf/%outputfile%"
		local mdtohtml_command = [[pandoc -F pandoc-crossref \
		             --standalone %docroot% \
		             -o ./.html/%outputfile% \
		             -M eqnPrefix='Eq' \
		             --mathjax \
		             --toc \
		             ]]

		_G.current_format = "html"

		vim.api.nvim_create_user_command("MarkdownToHTMLorPDF", function()
			if _G.current_format == "html" then
				_G.current_format = "pdf"
				gknapsettings = {
					mdoutputext = "pdf",
					mdtopdf = mdtopdf_command,
					mdtopdfviewerlaunch = "sumatrapdf.exe $(wslpath -w $(realpath ./.pdf/%outputfile%))",
					mdtopdfviewerrefresh = "none",
				}
			elseif _G.current_format == "pdf" then
				_G.current_format = "html"
				gknapsettings = {
					mdoutputext = "html",
					mdtohtml = mdtohtml_command,
					mdtohtmlviewerlaunch = "chrome.exe $(wslpath -w $(realpath ./.html/%outputfile%))",
					mdtohtmlviewerrefresh = "none",
				}
			end
			vim.g.knap_settings = gknapsettings
			print("knap format set to: " .. _G.current_format)
		end, {})

		kmap({ "n", "v", "i" }, "<F4>", "<cmd>MarkdownToHTMLorPDF<CR>", { desc = "toggle knap output" })

		local gknapsettings = {
			mdoutputext = "html",
			mdtohtml = mdtohtml_command,
			mdtohtmlviewerlaunch = "chrome.exe $(wslpath -w $(realpath ./.html/%outputfile%))",
			mdtohtmlviewerrefresh = "none",
			mdtopdf = mdtopdf_command,
			mdtopdfviewerlaunch = "sumatrapdf.exe $(wslpath -w $(realpath ./.pdf/%outputfile%))",
			mdtopdfviewerrefresh = "none",
		}

		vim.g.knap_settings = gknapsettings
	end,
}
