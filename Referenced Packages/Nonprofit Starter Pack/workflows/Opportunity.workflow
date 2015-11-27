<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Opportunity_Email_Acknowledgment</fullName>
        <description>Opportunity Email Acknowledgment</description>
        <protected>false</protected>
        <recipients>
            <field>Primary_Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>NPSP_Email_Templates/NPSP_Opportunity_Acknowledgment</template>
    </alerts>
    <fieldUpdates>
        <fullName>Opportunity_AcknowledgmentStatus_Update</fullName>
        <description>Sets the Acknowledgment Status to &quot;Acknowledged&quot;</description>
        <field>Acknowledgment_Status__c</field>
        <literalValue>Acknowledged</literalValue>
        <name>Opportunity Acknowledgment Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Opportunity_Acknowledgment_Date_Update</fullName>
        <description>sets the Acknowledgment Date to Today.</description>
        <field>Acknowledgment_Date__c</field>
        <formula>Today()</formula>
        <name>Opportunity Acknowledgment Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Opportunity Email Acknowledgment</fullName>
        <actions>
            <name>Opportunity_Email_Acknowledgment</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Opportunity_AcknowledgmentStatus_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Opportunity_Acknowledgment_Date_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Emails an acknowledgment to the Primary Contact when Email Acknowledgment is set.</description>
        <formula>TEXT(Acknowledgment_Status__c) = $Label.sendAcknowledgmentFireStatus &amp;&amp;  Primary_Contact__r.Email &lt;&gt; NULL &amp;&amp;  Primary_Contact__r.Do_Not_Contact__c &lt;&gt; True &amp;&amp;  Primary_Contact__r.HasOptedOutOfEmail &lt;&gt; True &amp;&amp;  Primary_Contact__r.Deceased__c &lt;&gt; True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
