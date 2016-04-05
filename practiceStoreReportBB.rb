require 'prawn'

$moveDownVal = 7

#
# Fills the background of the box you're in
#
def fill_bg_color color
	float do
		fill_color color
		fill_rectangle [0, bounds.height], bounds.width, bounds.height
		fill_color "000000"
	end
end

def draw_checkbox filled

	# draw filled rectangle if checkbox is checked
	if (filled)
		rectangle [0,0], 7, 7
		fill
	# draw unfilled rectangle if checkbox is not checked
	# negative because we want to move the boxes to be in line with the answers
	else
		line [0,0], [0,-7]
		line [0,-7], [7,-7]
		line [7,-7], [7,0]
		line [7,0], [0,0]
		stroke
	end

end

def checkbox_question answer, cursorPos, filled

	widthOfCheckbox = 18
	xPosOfCheckbox = 209

	widthOfShortAnswer = 324
	xPosOfShortAnswer = 227

	move_cursor_to(cursorPos)

	# checkbox 2
	bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

		move_down $moveDownVal
		draw_checkbox filled
		#stroke_bounds

		# move cusor so all bounding boxes are in the same row
		if (bounds.height != cursorPos) 
			cursorPos += bounds.height
		end
	end

	move_cursor_to(cursorPos)

	# answer 2
	bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

		move_down $moveDownVal
		text answer
		#stroke_bounds

		# move cursor down for next checkbox
		cursorPos -= bounds.height
	end

end

def build_page firstLayer

	widthOfQuestionTitle = 485
	widthOfQuestionScore = 65

	widthOfQuestionNumber = 18
	widthOfShortQuestion = 190
	widthOfCheckbox = 18
	widthOfShortAnswer = 324
	widthOfLongQandA = 534

	xPosOfQuestionNumber = 0
	xPosOfShortQuestion = 18
	xPosOfCheckbox = 209
	xPosOfShortAnswer = 227
	xPosOfLongQandA = 16

	font_size(9)

	#
	# Need to duplicate so that the content isn't covered by the filled rectangles
	#

	bounding_box([0, cursor], :width => 550) do

		# page heading
		bounding_box([0, cursor], :width => 550, :height => 50) do

			bounding_box([0, cursor], :width => widthOfQuestionTitle, :height => 50) do

				move_down 18
				indent(5) do
					font_size(15) { text "<b>B. Discover Needs</b>", :color => "ffffff", :inline_format => true }
				end
			end

			bounding_box([widthOfQuestionTitle, 50], :width => widthOfQuestionScore, :height => 50) do

				move_down 18
				font_size(12) {text "<b>8/16 | 50%</b>", :color => "ffffff", :inline_format => true}
			end

			#fill_color "30abdf"
			#stroke_bounds

			if (firstLayer)
				fill_bg_color "30abdf"
			end

		end

		# points row
		bounding_box([0,cursor], :width => 550) do

			move_down $moveDownVal
			font_size(10) {text "Points", :color => "30abdf", :align => :right}

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end

		# checkbox question
		bounding_box([0, cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do


				move_down $moveDownVal
				indent(3) do
					text "B1"
				end
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down $moveDownVal
				text "<b>What question did the salseperson ask?</b>", :inline_format => true
				#stroke_bounds

			end

			checkbox_question "General question(s) on how I would use the product", cursorPos, false
			checkbox_question "Where I would use the product: home, office, on the go, etc.", cursorPos -= bounds.height, false
			checkbox_question "If anyone else would use the product: family, friends, etc.", cursorPos, false
			checkbox_question "Questions about my work, studies, or hobbies", cursorPos, false
			checkbox_question "Questions about sepcific uses, such as email, Internet, phones, etc.", cursorPos, true
			checkbox_question "How I use other technology, such as current computer or smartphone", cursorPos, false
			checkbox_question "What type of computer I use (Apple Mac or Windows PC", cursorPos, false
			checkbox_question "If I own any other Apple products (iPod, iPhone, or iPad)", cursorPos, false

			#stroke_bounds


			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "f3f9fd"
			end

		end

		# basic question
		bounding_box([0,cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do

				move_down $moveDownVal
				indent(3) do
					text "B2"
				end
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				if (bounds.height != cursorPos) 
					cursorPos += bounds.height
				end

			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down $moveDownVal
				# for some reason I can't get this to be bolded?
				text "How many questions were asked?"
				#text "This is a basic question. What do we do if this question is realllllllllllllly long?"
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				if (bounds.height != cursorPos) 
					cursorPos += bounds.height
				end

			end

			move_cursor_to(cursorPos)

			# checkbox
			bounding_box([xPosOfCheckbox, cursorPos], :width => widthOfCheckbox) do

				move_down $moveDownVal
				text " "
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				#if (bounds.height != cursorPos) 
				#	cursorPos += bounds.height
				#end

			end

			#move_cursor_to(cursorPos)

			# answer
			bounding_box([xPosOfShortAnswer, cursorPos], :width => widthOfShortAnswer) do

				move_down $moveDownVal
				text "1"
				#stroke_bounds

				#move cursor down for next question
				cursorPos -= bounds.height
			end

			move_cursor_to(cursorPos)

			#stroke_bounds

			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end

		# extra question info
		bounding_box([0,cursor], :width => 550) do

			move_down $moveDownVal
			indent(3) do
				text "<b>We would like the better understand how the salseperson asked you questions about your product needs.</b>", :inline_format => true
			end
			#stroke_bounds

			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "f3f9fd"
			end

		end

		# checkbox question
		bounding_box([0, cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do


				move_down $moveDownVal
				indent(3) do
					text "B3"
				end
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down $moveDownVal
				text "<b>Did salseperson ask about needs?</b>", :inline_format => true
				#stroke_bounds

			end

			checkbox_question "Yes - asked questions about needs", cursorPos, false
			checkbox_question "No - had to volunteer needs", cursorPos -= bounds.height, true
			# Where does the text go that they specify?
			checkbox_question "Other; please specify", cursorPos, false

			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end

				# checkbox question
		bounding_box([0, cursor], :width => 550) do

			cursorPos = cursor

			# question number
			bounding_box([xPosOfQuestionNumber,0], :width => widthOfQuestionNumber) do


				move_down $moveDownVal
				indent(3) do
					text "B4"
				end
				#stroke_bounds

				# move cusor so all bounding boxes are in the same row
				cursorPos += bounds.height
			end

			move_cursor_to(cursorPos)

			# question
			bounding_box([xPosOfShortQuestion, cursorPos], :width => widthOfShortQuestion) do

				move_down $moveDownVal
				text "<b>Did salesperson as for more info?</b>", :inline_format => true
				#stroke_bounds

			end

			checkbox_question "Yes", cursorPos, false
			checkbox_question "No", cursorPos -= bounds.height, true

			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "f3f9fd"
			end

		end

		# descriptive question
		bounding_box([0,cursor], :width => widthOfQuestionNumber) do

			cursorPos = cursor

			# question number
			bounding_box([0,cursor], :width => widthOfQuestionNumber) do

				move_down $moveDownVal
				indent(3) do
					text "B5"
				end
				#stroke_bounds

				cursorPos += bounds.height

			end

			move_cursor_to(cursorPos)

			# question description
			bounding_box([xPosOfLongQandA, cursor], :width => widthOfLongQandA) do

				move_down $moveDownVal
				text "<b>Please describe the following:\n- How the salseperson responded when you stated your interest in a tablet.\n- What questions they asked to understand your needs.\n- Please note if the salseperson led the interaction, or if you had tovolunteer information to keep the conversation going.</b>", :inline_format => true
				#stroke_bounds

			end

			# question answer
			bounding_box([xPosOfLongQandA,cursor], :width => widthOfLongQandA) do

				move_down $moveDownVal
				text "<i>When I arrived to the store I saw two sales people, one was serving a suctomer and the other was behind the counter. I was not quite sure if they were doing paperwork or if thes alseperson thought that I did not need help. Then the salseperson approached me after waiting for some minutes, they asked me what I was looking for. I explained them that I was looking for a tablet and the salseperson indicated me where the tablets were, so I had to ask some questions to keep the conversation going; I told them that I was looking for something light and with Internet access, so salseperson asked me about the usage I would give to the device and asked me if I would search on the Internet, read emails and share information on the social networks. Apart from that the salesperson did not make further questions. I had to lead the whole interaction.<i>", :inline_format => true
				#stroke_bounds

			end

			#stroke_bounds

			move_down $moveDownVal

			if (firstLayer)
				fill_bg_color "ffffff"
			end

		end

		stroke_bounds

		move_cursor_to(bounds.height)

	end

end

# generate pdf using bounding box

Prawn::Document::generate("generatedPracticeReport.pdf") do 

	stroke_axis

	build_page true
	build_page false

end


# ISSUES:
# 1) When any single entry spans more than one row, the formatting goes crazy
# 2) Stroke thickness on border
# 3) Font and font size
# 4) PADDING
# 5) Can't get basic question to be bolded








