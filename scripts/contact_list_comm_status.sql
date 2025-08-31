--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contact_list_comm_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_list_comm_status (
    contact_list_id character varying(20) NOT NULL,
    communication_event_id character varying(20) NOT NULL,
    contact_mech_id character varying(20) NOT NULL,
    party_id character varying(20),
    message_id character varying(255),
    status_id character varying(20),
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_list_comm_status OWNER TO ofbiz;

--
-- Name: contact_list_comm_status pk_contact_list_comm_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT pk_contact_list_comm_status PRIMARY KEY (contact_list_id, communication_event_id, contact_mech_id);


--
-- Name: cnct_lst_cst_ce; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_ce ON contact_list_comm_status USING btree (communication_event_id);


--
-- Name: cnct_lst_cst_cl; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_cl ON contact_list_comm_status USING btree (contact_list_id);


--
-- Name: cnct_lst_cst_cm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_cm ON contact_list_comm_status USING btree (contact_mech_id);


--
-- Name: cnct_lst_cst_pt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_pt ON contact_list_comm_status USING btree (party_id);


--
-- Name: cnct_lst_cst_st; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_st ON contact_list_comm_status USING btree (status_id);


--
-- Name: cnct_lst_cst_st_ul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cst_st_ul ON contact_list_comm_status USING btree (change_by_user_login_id);


--
-- Name: cnt_lst_cmm_sts_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_lst_cmm_sts_tp ON contact_list_comm_status USING btree (last_updated_tx_stamp);


--
-- Name: cnt_lst_cmm_sts_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_lst_cmm_sts_ts ON contact_list_comm_status USING btree (created_tx_stamp);


--
-- Name: cntlstcst_msg_id; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE UNIQUE INDEX cntlstcst_msg_id ON contact_list_comm_status USING btree (message_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_ce; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_ce FOREIGN KEY (communication_event_id) REFERENCES communication_event(communication_event_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_cl; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_cl FOREIGN KEY (contact_list_id) REFERENCES contact_list(contact_list_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_cm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_cm FOREIGN KEY (contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_pt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_pt FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_st; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_st FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: contact_list_comm_status cnct_lst_cst_st_ul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_comm_status
    ADD CONSTRAINT cnct_lst_cst_st_ul FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- PostgreSQL database dump complete
--

