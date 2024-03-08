import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hkorn_new/ui/shared/base_appbar.dart';
import 'package:hkorn_new/ui/shared/widgets/memebership_widget.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutState();
}

const htmlData = r"""
<p><strong><span style="font-size: 16px;">About HKORN</span></strong></p>
<p><br>The Association aims to promote professional knowledge, skills and standards of members through professional educational activities relating Perioperative Nursing and Operating Room practices.<br>The Association aims to promote professional knowledge, skills and standards of members through professional educational activities relating Perioperative Nursing and Operating Room practices. It will also promote the welfare of members in general, and to address their concerns.</p>
<p><br><strong>OBJECTIVES</strong></p>
<p><br>1. To promote professional knowledge and competence of members in Perioperative Nursing and Operating Room practices, through organization of training programmes and other professional development activities. 
2. To provide a forum for members to discuss matters in relation to provision of Operating Room service and quality improvement in their practices. 
3. To promote research in matters relating to Perioperative Nursing and Operating Room Services.
4. To grant sponsorship and to facilitate members in professional development activities.
5. To send members as representatives of the Association to attend local or overseas conferences for interchange of professional knowledge and skills.
6. To raise funds for the promotion of the above-mentioned activities.
</p>
<p><br><strong>MEMBERSHIP</strong></p>
<p><br>Ordinary Member Membership shall be awarded to any Hong Kong Registered Nurses or Enrolled Nurses who are interested in Perioperative Nursing and Operating Room Services, and who have paid the appropriate joining fee and annual subscription of the Association. Affiliated Member Membership shall be awarded to persons who work in the Operating Room or allied services, and who have paid the appropriate annual subscription of the Association. Retired Member Ordinary Members or Affiliated Members upon retirement can apply for the status of Retired Member, and shall be granted membership upon payment of appropriate annual subscription of the Association. Honorary Member Membership shall be awarded to persons who have outstanding achievement, or whose work has reached a level of excellence in nursing or in Operating Room services and who are recommended by the Council of the Association.</p>
	<br>
	<br>
	<p style="font-weight: bold">Application for Ordinary, Affiliated or Retired membership shall be directed to, and approved by the Council of the Association.&nbsp;</p>
	
	""";

class _AboutState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
        title: 'About',
        context: context,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Html(
              data: htmlData,
              tagsList: Html.tags,
              style: {
                "table": Style(
                  backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "tr": Style(
                  border: const Border(bottom: BorderSide(color: Colors.grey)),
                ),
                "th": Style(
                  padding: const EdgeInsets.all(6),
                  backgroundColor: Colors.grey,
                ),
                "td": Style(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                ),
                'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
              },
            ),
            const Padding(
                padding: EdgeInsets.all(10.0), child: MembershipWidget())
          ],
        ),
      ),
    );
  }
}
