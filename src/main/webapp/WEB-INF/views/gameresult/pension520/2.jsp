<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="body">
	<div class="containerWrap">
		<section class="contentSection">
			<!-- ----------왼쪽메뉴---------- 영역 -->
			<nav class="lnbNav">
					<div id="snb" class="lnb">
						<h2 id="03" class="lnb_title">당첨결과</h2>
						<ul id="lnb" class="lnb_dep1">
							<li id="03-01"><a href="${pageContext.request.contextPath }/gameresult/lotto645/1" class="menuLnb"><span>로또6/45</span></a></li>
							<li id="03-02" class="active"><a href="#" class="menuLnb"><span>연금복권520</span></a>
								<ul class="lnb_dep2">
									<li id="03-02-01"><a href="${pageContext.request.contextPath }/gameresult/pension520/1"><span>회차별 당첨번호</span></a></li>
									<li id="03-02-02" class="active"><a href="${pageContext.request.contextPath }/gameresult/pension520/2"><span> 내번호 당첨확인</span></a></li>
									<li id="03-02-03"><a href="${pageContext.request.contextPath }/gameresult/pension520/3"><span> 당첨내역</span></a></li>
									<li id="03-02-04"><a href="${pageContext.request.contextPath }/gameresult/pension520/4"><span> 당첨금 지급안내</span></a></li>
									<li id="03-02-05"><a href="${pageContext.request.contextPath }/gameresult/pension520/5"><span> 추첨방송 다시보기</span></a></li>
									<li id="03-02-06"><a href="${pageContext.request.contextPath }/gameresult/pension520/6"><span> 추첨방송 참관신청</span></a></li>
								</ul></li>
							<li id="03-05"><a href="#" class="menuLnb"><span>로또6/45 당첨통계</span></a></li>
							<li id="03-06"><a href="#" class="menuLnb"><span style="letter-spacing: -1px;">연금복권520 당첨통계</span></a></li>
							<li id="03-07"><a href="#" class="menuLnb"><span>당첨소식</span></a></li>
							<li id="03-08"><a href="#" class="menuLnb"><span>미수령 당첨금</span></a></li>
						</ul>
					</div>
	
	
					<a href="#" target="_blank"><img
						src="${pageContext.request.contextPath }/resources/images/common/leftm_banner05.png"
						alt="당첨확인서비스"></a>
				</nav>
				<!-- -------------------------------------- -->
			<!-- ----------메인컨텐츠---------- 영역 -->
			<div id="article" class="contentsArticle">
				<div class="header_article">
					<h3 class="sub_title">내번호 당첨확인</h3>
					<p class="location">
						<a class="home" href="/"> Home </a><span class="gt">&gt;</span><a
							href="#">당첨결과</a><span class="gt">&gt;</span><a href="#"><span>연금복권520</span></a><span
							class="gt">&gt;</span><a href="#"> 내번호 당첨확인</a>
					</p>
				</div>
				<div>
					<div class="content_wrap content_my_520win">
						<div class="group_content">
							<div class="group_title">
								<h4 class="title">회차별 당첨 확인</h4>
								<p class="desc">번호를 입력하시면 선택 회차와 비교하여 결과를 바로 알 수 있습니다.</p>
							</div>
							<div class="group_inner">
								<div class="search_data">
									<div class="inner left">
										<form id="frm" name="frm" method="post">
											<select id="Round" name="Round" title="회차 선택">


												<option value="420" selected="">420</option>


												<option value="419">419</option>


												<option value="418">418</option>


												<option value="417">417</option>


												<option value="416">416</option>


												<option value="415">415</option>


												<option value="414">414</option>


												<option value="413">413</option>


												<option value="412">412</option>


												<option value="411">411</option>


												<option value="410">410</option>


												<option value="409">409</option>


												<option value="408">408</option>


												<option value="407">407</option>


												<option value="406">406</option>


												<option value="405">405</option>


												<option value="404">404</option>


												<option value="403">403</option>


												<option value="402">402</option>


												<option value="401">401</option>


												<option value="400">400</option>


												<option value="399">399</option>


												<option value="398">398</option>


												<option value="397">397</option>


												<option value="396">396</option>


												<option value="395">395</option>


												<option value="394">394</option>


												<option value="393">393</option>


												<option value="392">392</option>


												<option value="391">391</option>


												<option value="390">390</option>


												<option value="389">389</option>


												<option value="388">388</option>


												<option value="387">387</option>


												<option value="386">386</option>


												<option value="385">385</option>


												<option value="384">384</option>


												<option value="383">383</option>


												<option value="382">382</option>


												<option value="381">381</option>


												<option value="380">380</option>


												<option value="379">379</option>


												<option value="378">378</option>


												<option value="377">377</option>


												<option value="376">376</option>


												<option value="375">375</option>


												<option value="374">374</option>


												<option value="373">373</option>


												<option value="372">372</option>


												<option value="371">371</option>


												<option value="370">370</option>


												<option value="369">369</option>


												<option value="368">368</option>


												<option value="367">367</option>


												<option value="366">366</option>


												<option value="365">365</option>


												<option value="364">364</option>


												<option value="363">363</option>


												<option value="362">362</option>


												<option value="361">361</option>


												<option value="360">360</option>


												<option value="359">359</option>


												<option value="358">358</option>


												<option value="357">357</option>


												<option value="356">356</option>


												<option value="355">355</option>


												<option value="354">354</option>


												<option value="353">353</option>


												<option value="352">352</option>


												<option value="351">351</option>


												<option value="350">350</option>


												<option value="349">349</option>


												<option value="348">348</option>


												<option value="347">347</option>


												<option value="346">346</option>


												<option value="345">345</option>


												<option value="344">344</option>


												<option value="343">343</option>


												<option value="342">342</option>


												<option value="341">341</option>


												<option value="340">340</option>


												<option value="339">339</option>


												<option value="338">338</option>


												<option value="337">337</option>


												<option value="336">336</option>


												<option value="335">335</option>


												<option value="334">334</option>


												<option value="333">333</option>


												<option value="332">332</option>


												<option value="331">331</option>


												<option value="330">330</option>


												<option value="329">329</option>


												<option value="328">328</option>


												<option value="327">327</option>


												<option value="326">326</option>


												<option value="325">325</option>


												<option value="324">324</option>


												<option value="323">323</option>


												<option value="322">322</option>


												<option value="321">321</option>


												<option value="320">320</option>


												<option value="319">319</option>


												<option value="318">318</option>


												<option value="317">317</option>


												<option value="316">316</option>


												<option value="315">315</option>


												<option value="314">314</option>


												<option value="313">313</option>


												<option value="312">312</option>


												<option value="311">311</option>


												<option value="310">310</option>


												<option value="309">309</option>


												<option value="308">308</option>


												<option value="307">307</option>


												<option value="306">306</option>


												<option value="305">305</option>


												<option value="304">304</option>


												<option value="303">303</option>


												<option value="302">302</option>


												<option value="301">301</option>


												<option value="300">300</option>


												<option value="299">299</option>


												<option value="298">298</option>


												<option value="297">297</option>


												<option value="296">296</option>


												<option value="295">295</option>


												<option value="294">294</option>


												<option value="293">293</option>


												<option value="292">292</option>


												<option value="291">291</option>


												<option value="290">290</option>


												<option value="289">289</option>


												<option value="288">288</option>


												<option value="287">287</option>


												<option value="286">286</option>


												<option value="285">285</option>


												<option value="284">284</option>


												<option value="283">283</option>


												<option value="282">282</option>


												<option value="281">281</option>


												<option value="280">280</option>


												<option value="279">279</option>


												<option value="278">278</option>


												<option value="277">277</option>


												<option value="276">276</option>


												<option value="275">275</option>


												<option value="274">274</option>


												<option value="273">273</option>


												<option value="272">272</option>


												<option value="271">271</option>


												<option value="270">270</option>


												<option value="269">269</option>


												<option value="268">268</option>


												<option value="267">267</option>


												<option value="266">266</option>


												<option value="265">265</option>


												<option value="264">264</option>


												<option value="263">263</option>


												<option value="262">262</option>


												<option value="261">261</option>


												<option value="260">260</option>


												<option value="259">259</option>


												<option value="258">258</option>


												<option value="257">257</option>


												<option value="256">256</option>


												<option value="255">255</option>


												<option value="254">254</option>


												<option value="253">253</option>


												<option value="252">252</option>


												<option value="251">251</option>


												<option value="250">250</option>


												<option value="249">249</option>


												<option value="248">248</option>


												<option value="247">247</option>


												<option value="246">246</option>


												<option value="245">245</option>


												<option value="244">244</option>


												<option value="243">243</option>


												<option value="242">242</option>


												<option value="241">241</option>


												<option value="240">240</option>


												<option value="239">239</option>


												<option value="238">238</option>


												<option value="237">237</option>


												<option value="236">236</option>


												<option value="235">235</option>


												<option value="234">234</option>


												<option value="233">233</option>


												<option value="232">232</option>


												<option value="231">231</option>


												<option value="230">230</option>


												<option value="229">229</option>


												<option value="228">228</option>


												<option value="227">227</option>


												<option value="226">226</option>


												<option value="225">225</option>


												<option value="224">224</option>


												<option value="223">223</option>


												<option value="222">222</option>


												<option value="221">221</option>


												<option value="220">220</option>


												<option value="219">219</option>


												<option value="218">218</option>


												<option value="217">217</option>


												<option value="216">216</option>


												<option value="215">215</option>


												<option value="214">214</option>


												<option value="213">213</option>


												<option value="212">212</option>


												<option value="211">211</option>


												<option value="210">210</option>


												<option value="209">209</option>


												<option value="208">208</option>


												<option value="207">207</option>


												<option value="206">206</option>


												<option value="205">205</option>


												<option value="204">204</option>


												<option value="203">203</option>


												<option value="202">202</option>


												<option value="201">201</option>


												<option value="200">200</option>


												<option value="199">199</option>


												<option value="198">198</option>


												<option value="197">197</option>


												<option value="196">196</option>


												<option value="195">195</option>


												<option value="194">194</option>


												<option value="193">193</option>


												<option value="192">192</option>


												<option value="191">191</option>


												<option value="190">190</option>


												<option value="189">189</option>


												<option value="188">188</option>


												<option value="187">187</option>


												<option value="186">186</option>


												<option value="185">185</option>


												<option value="184">184</option>


												<option value="183">183</option>


												<option value="182">182</option>


												<option value="181">181</option>


												<option value="180">180</option>


												<option value="179">179</option>


												<option value="178">178</option>


												<option value="177">177</option>


												<option value="176">176</option>


												<option value="175">175</option>


												<option value="174">174</option>


												<option value="173">173</option>


												<option value="172">172</option>


												<option value="171">171</option>


												<option value="170">170</option>


												<option value="169">169</option>


												<option value="168">168</option>


												<option value="167">167</option>


												<option value="166">166</option>


												<option value="165">165</option>


												<option value="164">164</option>


												<option value="163">163</option>


												<option value="162">162</option>


												<option value="161">161</option>


												<option value="160">160</option>


												<option value="159">159</option>


												<option value="158">158</option>


												<option value="157">157</option>


												<option value="156">156</option>


												<option value="155">155</option>


												<option value="154">154</option>


												<option value="153">153</option>


												<option value="152">152</option>


												<option value="151">151</option>


												<option value="150">150</option>


												<option value="149">149</option>


												<option value="148">148</option>


												<option value="147">147</option>


												<option value="146">146</option>


												<option value="145">145</option>


												<option value="144">144</option>


												<option value="143">143</option>


												<option value="142">142</option>


												<option value="141">141</option>


												<option value="140">140</option>


												<option value="139">139</option>


												<option value="138">138</option>


												<option value="137">137</option>


												<option value="136">136</option>


												<option value="135">135</option>


												<option value="134">134</option>


												<option value="133">133</option>


												<option value="132">132</option>


												<option value="131">131</option>


												<option value="130">130</option>


												<option value="129">129</option>


												<option value="128">128</option>


												<option value="127">127</option>


												<option value="126">126</option>


												<option value="125">125</option>


												<option value="124">124</option>


												<option value="123">123</option>


												<option value="122">122</option>


												<option value="121">121</option>


												<option value="120">120</option>


												<option value="119">119</option>


												<option value="118">118</option>


												<option value="117">117</option>


												<option value="116">116</option>


												<option value="115">115</option>


												<option value="114">114</option>


												<option value="113">113</option>


												<option value="112">112</option>


												<option value="111">111</option>


												<option value="110">110</option>


												<option value="109">109</option>


												<option value="108">108</option>


												<option value="107">107</option>


												<option value="106">106</option>


												<option value="105">105</option>


												<option value="104">104</option>


												<option value="103">103</option>


												<option value="102">102</option>


												<option value="101">101</option>


												<option value="100">100</option>


												<option value="99">99</option>


												<option value="98">98</option>


												<option value="97">97</option>


												<option value="96">96</option>


												<option value="95">95</option>


												<option value="94">94</option>


												<option value="93">93</option>


												<option value="92">92</option>


												<option value="91">91</option>


												<option value="90">90</option>


												<option value="89">89</option>


												<option value="88">88</option>


												<option value="87">87</option>


												<option value="86">86</option>


												<option value="85">85</option>


												<option value="84">84</option>


												<option value="83">83</option>


												<option value="82">82</option>


												<option value="81">81</option>


												<option value="80">80</option>


												<option value="79">79</option>


												<option value="78">78</option>


												<option value="77">77</option>


												<option value="76">76</option>


												<option value="75">75</option>


												<option value="74">74</option>


												<option value="73">73</option>


												<option value="72">72</option>


												<option value="71">71</option>


												<option value="70">70</option>


												<option value="69">69</option>


												<option value="68">68</option>


												<option value="67">67</option>


												<option value="66">66</option>


												<option value="65">65</option>


												<option value="64">64</option>


												<option value="63">63</option>


												<option value="62">62</option>


												<option value="61">61</option>


												<option value="60">60</option>


												<option value="59">59</option>


												<option value="58">58</option>


												<option value="57">57</option>


												<option value="56">56</option>


												<option value="55">55</option>


												<option value="54">54</option>


												<option value="53">53</option>


												<option value="52">52</option>


												<option value="51">51</option>


												<option value="50">50</option>


												<option value="49">49</option>


												<option value="48">48</option>


												<option value="47">47</option>


												<option value="46">46</option>


												<option value="45">45</option>


												<option value="44">44</option>


												<option value="43">43</option>


												<option value="42">42</option>


												<option value="41">41</option>


												<option value="40">40</option>


												<option value="39">39</option>


												<option value="38">38</option>


												<option value="37">37</option>


												<option value="36">36</option>


												<option value="35">35</option>


												<option value="34">34</option>


												<option value="33">33</option>


												<option value="32">32</option>


												<option value="31">31</option>


												<option value="30">30</option>


												<option value="29">29</option>


												<option value="28">28</option>


												<option value="27">27</option>


												<option value="26">26</option>


												<option value="25">25</option>


												<option value="24">24</option>


												<option value="23">23</option>


												<option value="22">22</option>


												<option value="21">21</option>


												<option value="20">20</option>


												<option value="19">19</option>


												<option value="18">18</option>


												<option value="17">17</option>


												<option value="16">16</option>


												<option value="15">15</option>


												<option value="14">14</option>


												<option value="13">13</option>


												<option value="12">12</option>


												<option value="11">11</option>


												<option value="10">10</option>


												<option value="9">9</option>


												<option value="8">8</option>


												<option value="7">7</option>


												<option value="6">6</option>


												<option value="5">5</option>


												<option value="4">4</option>


												<option value="3">3</option>


												<option value="2">2</option>


												<option value="1">1</option>

											</select>
										</form>
										<span class="unit">지급개시일로부터 1년 이내의 당첨번호 조회만 가능합니다.</span>
									</div>
								</div>
								<table class="tbl_data tbl_form" id="win520">
									<caption>선택된 회차와 내 선택 번호를 비교해서 등수를 확인합니다.</caption>
									<colgroup>
										<col>
										<col style="width: 145px">
										<col style="width: 150px">
										<col style="width: 105px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">확인</th>
											<th scope="col">입력조/번호</th>
											<th scope="col">등수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input name="search_1" id="search1_1" type="text"
												maxlength="1" value="" title="조 입력"> <span
												class="unit">조</span> <input class="inputs1" name="search_2"
												id="search1_2" type="text" maxlength="1" value=""
												title="첫번째 번호 입력"> <input class="inputs1"
												name="search_3" id="search1_3" type="text" maxlength="1"
												value="" title="두번째 번호 입력"> <input class="inputs1"
												name="search_4" id="search1_4" type="text" maxlength="1"
												value="" title="세번째 번호 입력"> <input class="inputs1"
												name="search_5" id="search1_5" type="text" maxlength="1"
												value="" title="네번째 번호 입력"> <input class="inputs1"
												name="search_6" id="search1_6" type="text" maxlength="1"
												value="" title="다섯번째 번호 입력"> <input class="inputs1"
												name="search_7" id="search1_7" type="text" maxlength="1"
												value="" title="여섯번째 번호 입력"></td>
											<td><a id="btnSearch1" class="btn_common form blu"
												href="#">결과확인</a></td>
											<td id="result1_01"></td>
											<td id="result1_02"></td>
										</tr>
										<tr>
											<td><input name="search_1" id="search2_1" type="text"
												maxlength="1" value="" title="조 입력"> <span
												class="unit">조</span> <input class="inputs2" name="search_2"
												id="search2_2" type="text" maxlength="1" value=""
												title="첫번째 번호 입력"> <input class="inputs2"
												name="search_3" id="search2_3" type="text" maxlength="1"
												value="" title="두번째 번호 입력"> <input class="inputs2"
												name="search_4" id="search2_4" type="text" maxlength="1"
												value="" title="세번째 번호 입력"> <input class="inputs2"
												name="search_5" id="search2_5" type="text" maxlength="1"
												value="" title="네번째 번호 입력"> <input class="inputs2"
												name="search_6" id="search2_6" type="text" maxlength="1"
												value="" title="다섯번째 번호 입력"> <input class="inputs2"
												name="search_7" id="search2_7" type="text" maxlength="1"
												value="" title="여섯번째 번호 입력"></td>
											<td><a id="btnSearch2" class="btn_common form blu"
												href="#">결과확인</a></td>
											<td id="result2_01"></td>
											<td id="result2_02"></td>
										</tr>
										<tr>
											<td><input name="search_1" id="search3_1" type="text"
												maxlength="1" value="" title="조 입력"> <span
												class="unit">조</span> <input class="inputs3" name="search_2"
												id="search3_2" type="text" maxlength="1" value=""
												title="첫번째 번호 입력"> <input class="inputs3"
												name="search_3" id="search3_3" type="text" maxlength="1"
												value="" title="두번째 번호 입력"> <input class="inputs3"
												name="search_4" id="search3_4" type="text" maxlength="1"
												value="" title="세번째 번호 입력"> <input class="inputs3"
												name="search_5" id="search3_5" type="text" maxlength="1"
												value="" title="네번째 번호 입력"> <input class="inputs3"
												name="search_6" id="search3_6" type="text" maxlength="1"
												value="" title="다섯번째 번호 입력"> <input class="inputs3"
												name="search_7" id="search3_7" type="text" maxlength="1"
												value="" title="여섯번째 번호 입력"></td>
											<td><a id="btnSearch3" class="btn_common form blu"
												href="#">결과확인</a></td>
											<td id="result3_01"></td>
											<td id="result3_02"></td>
										</tr>
										<tr>
											<td><input name="search_1" id="search4_1" type="text"
												maxlength="1" value="" title="조 입력"> <span
												class="unit">조</span> <input class="inputs4" name="search_2"
												id="search4_2" type="text" maxlength="1" value=""
												title="첫번째 번호 입력"> <input class="inputs4"
												name="search_3" id="search4_3" type="text" maxlength="1"
												value="" title="두번째 번호 입력"> <input class="inputs4"
												name="search_4" id="search4_4" type="text" maxlength="1"
												value="" title="세번째 번호 입력"> <input class="inputs4"
												name="search_5" id="search4_5" type="text" maxlength="1"
												value="" title="네번째 번호 입력"> <input class="inputs4"
												name="search_6" id="search4_6" type="text" maxlength="1"
												value="" title="다섯번째 번호 입력"> <input class="inputs4"
												name="search_7" id="search4_7" type="text" maxlength="1"
												value="" title="여섯번째 번호 입력"></td>
											<td><a id="btnSearch4" class="btn_common form blu"
												href="#">결과확인</a></td>
											<td id="result4_01"></td>
											<td id="result4_02"></td>
										</tr>
										<tr>
											<td><input name="search_1" id="search5_1" type="text"
												maxlength="1" value="" title="조 입력"> <span
												class="unit">조</span> <input class="inputs5" name="search_2"
												id="search5_2" type="text" maxlength="1" value=""
												title="첫번째 번호 입력"> <input class="inputs5"
												name="search_3" id="search5_3" type="text" maxlength="1"
												value="" title="두번째 번호 입력"> <input class="inputs5"
												name="search_4" id="search5_4" type="text" maxlength="1"
												value="" title="세번째 번호 입력"> <input class="inputs5"
												name="search_5" id="search5_5" type="text" maxlength="1"
												value="" title="네번째 번호 입력"> <input class="inputs5"
												name="search_6" id="search5_6" type="text" maxlength="1"
												value="" title="다섯번째 번호 입력"> <input class="inputs5"
												name="search_7" id="search5_7" type="text" maxlength="1"
												value="" title="여섯번째 번호 입력"></td>
											<td><a id="btnSearch5" class="btn_common form blu"
												href="#">결과확인</a></td>
											<td id="result5_01"></td>
											<td id="result5_02"></td>
										</tr>
									</tbody>
								</table>
								<div class="btns_submit search">
									<a href="#" id="btnDefault" class="btn_common mid">초기화</a>
								</div>
							</div>
						</div>
						<div class="group_content">
							<div class="group_title">
								<h4 class="title">연금복권520 2등 확인방법</h4>
							</div>
							<div class="group_inner">
								<ul class="list_text_common">
									<li>연금복권520의 2등 당첨번호는 1등의 앞, 뒷번호로 1등 당첨번호가 2조 123456번 일
										경우, 2등 당첨번호는 1등의 앞번호인 2조 123455번과 1등의 뒷번호인 2조 123457번입니다.</li>
									<li>아울러, 1등 당첨번호가 해당조의 처음과 마지막 번호일 경우에는 아래와 같이 적용합니다.
										<ul>
											<li>예1) 1등 당첨번호 2조 100000번 일 경우 &gt; 2등 2조 999999번, 2조
												100001번</li>
											<li>예2) 1등 당첨번호 2조 999999번 일 경우 &gt; 2등 2조 999998번, 2조
												100000번</li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>
