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
-- Name: web_site_contact_list; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_contact_list (
    web_site_id character varying(20) NOT NULL,
    contact_list_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_contact_list OWNER TO ofbiz;

--
-- Name: web_site_contact_list pk_web_site_contact_list; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_contact_list
    ADD CONSTRAINT pk_web_site_contact_list PRIMARY KEY (web_site_id, contact_list_id, from_date);


--
-- Name: cntct_lst_web_site; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntct_lst_web_site ON web_site_contact_list USING btree (contact_list_id);


--
-- Name: wb_st_cnt_lst_txcs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cnt_lst_txcs ON web_site_contact_list USING btree (created_tx_stamp);


--
-- Name: wb_st_cnt_lst_txsp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_cnt_lst_txsp ON web_site_contact_list USING btree (last_updated_tx_stamp);


--
-- Name: web_site_cntct_lst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX web_site_cntct_lst ON web_site_contact_list USING btree (web_site_id);


--
-- Name: web_site_contact_list cntct_lst_web_site; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_contact_list
    ADD CONSTRAINT cntct_lst_web_site FOREIGN KEY (contact_list_id) REFERENCES contact_list(contact_list_id);


--
-- Name: web_site_contact_list web_site_cntct_lst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_contact_list
    ADD CONSTRAINT web_site_cntct_lst FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

