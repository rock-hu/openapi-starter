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
-- Name: contact_list; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_list (
    contact_list_id character varying(20) NOT NULL,
    contact_list_type_id character varying(20),
    contact_mech_type_id character varying(20),
    marketing_campaign_id character varying(20),
    contact_list_name character varying(100),
    description character varying(255),
    comments character varying(255),
    is_public character(1),
    single_use character(1),
    owner_party_id character varying(20),
    verify_email_from character varying(255),
    verify_email_screen character varying(255),
    verify_email_subject character varying(255),
    verify_email_web_site_id character varying(20),
    opt_out_screen character varying(255),
    created_by_user_login character varying(255),
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_list OWNER TO ofbiz;

--
-- Name: contact_list pk_contact_list; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT pk_contact_list PRIMARY KEY (contact_list_id);


--
-- Name: cnct_lst_cbul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cbul ON contact_list USING btree (created_by_user_login);


--
-- Name: cnct_lst_cmchtp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_cmchtp ON contact_list USING btree (contact_mech_type_id);


--
-- Name: cnct_lst_lmul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_lmul ON contact_list USING btree (last_modified_by_user_login);


--
-- Name: cnct_lst_mkcmpn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_mkcmpn ON contact_list USING btree (marketing_campaign_id);


--
-- Name: cnct_lst_opty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_opty ON contact_list USING btree (owner_party_id);


--
-- Name: cnct_lst_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lst_typ ON contact_list USING btree (contact_list_type_id);


--
-- Name: cntct_lst_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntct_lst_txcrts ON contact_list USING btree (created_tx_stamp);


--
-- Name: cntct_lst_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntct_lst_txstmp ON contact_list USING btree (last_updated_tx_stamp);


--
-- Name: contact_list cnct_lst_cbul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_cbul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: contact_list cnct_lst_cmchtp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_cmchtp FOREIGN KEY (contact_mech_type_id) REFERENCES contact_mech_type(contact_mech_type_id);


--
-- Name: contact_list cnct_lst_lmul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_lmul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: contact_list cnct_lst_mkcmpn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_mkcmpn FOREIGN KEY (marketing_campaign_id) REFERENCES marketing_campaign(marketing_campaign_id);


--
-- Name: contact_list cnct_lst_opty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_opty FOREIGN KEY (owner_party_id) REFERENCES party(party_id);


--
-- Name: contact_list cnct_lst_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list
    ADD CONSTRAINT cnct_lst_typ FOREIGN KEY (contact_list_type_id) REFERENCES contact_list_type(contact_list_type_id);


--
-- PostgreSQL database dump complete
--

