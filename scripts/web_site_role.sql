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
-- Name: web_site_role; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE web_site_role (
    party_id character varying(20) NOT NULL,
    role_type_id character varying(20) NOT NULL,
    web_site_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    sequence_num numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.web_site_role OWNER TO ofbiz;

--
-- Name: web_site_role pk_web_site_role; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_role
    ADD CONSTRAINT pk_web_site_role PRIMARY KEY (party_id, role_type_id, web_site_id, from_date);


--
-- Name: wb_st_rl_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_rl_txcrts ON web_site_role USING btree (created_tx_stamp);


--
-- Name: wb_st_rl_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wb_st_rl_txstmp ON web_site_role USING btree (last_updated_tx_stamp);


--
-- Name: wsrle_ptyrle; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsrle_ptyrle ON web_site_role USING btree (party_id, role_type_id);


--
-- Name: wsrle_wsite; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX wsrle_wsite ON web_site_role USING btree (web_site_id);


--
-- Name: web_site_role wsrle_ptyrle; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_role
    ADD CONSTRAINT wsrle_ptyrle FOREIGN KEY (party_id, role_type_id) REFERENCES party_role(party_id, role_type_id);


--
-- Name: web_site_role wsrle_wsite; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY web_site_role
    ADD CONSTRAINT wsrle_wsite FOREIGN KEY (web_site_id) REFERENCES web_site(web_site_id);


--
-- PostgreSQL database dump complete
--

