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
-- Name: contact_list_party_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_list_party_status (
    contact_list_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    status_date timestamp with time zone NOT NULL,
    status_id character varying(20),
    set_by_user_login_id character varying(255),
    opt_in_verify_code character varying(60),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_list_party_status OWNER TO ofbiz;

--
-- Name: contact_list_party_status pk_contact_list_party_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party_status
    ADD CONSTRAINT pk_contact_list_party_status PRIMARY KEY (contact_list_id, party_id, from_date, status_date);


--
-- Name: cnt_lst_prt_sts_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_lst_prt_sts_tp ON contact_list_party_status USING btree (last_updated_tx_stamp);


--
-- Name: cnt_lst_prt_sts_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnt_lst_prt_sts_ts ON contact_list_party_status USING btree (created_tx_stamp);


--
-- Name: ctlstptst_clp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ctlstptst_clp ON contact_list_party_status USING btree (contact_list_id, party_id, from_date);


--
-- Name: contact_list_party_status ctlstptst_clp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party_status
    ADD CONSTRAINT ctlstptst_clp FOREIGN KEY (contact_list_id, party_id, from_date) REFERENCES contact_list_party(contact_list_id, party_id, from_date);


--
-- PostgreSQL database dump complete
--

