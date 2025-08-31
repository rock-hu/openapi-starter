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
-- Name: protected_view; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE protected_view (
    group_id character varying(20) NOT NULL,
    view_name_id character varying(60) NOT NULL,
    max_hits numeric(20,0),
    max_hits_duration numeric(20,0),
    tarpit_duration numeric(20,0),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.protected_view OWNER TO ofbiz;

--
-- Name: protected_view pk_protected_view; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY protected_view
    ADD CONSTRAINT pk_protected_view PRIMARY KEY (group_id, view_name_id);


--
-- Name: prtctd_vw_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtctd_vw_txcrts ON protected_view USING btree (created_tx_stamp);


--
-- Name: prtctd_vw_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prtctd_vw_txstmp ON protected_view USING btree (last_updated_tx_stamp);


--
-- Name: view_secgrp_grp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX view_secgrp_grp ON protected_view USING btree (group_id);


--
-- Name: protected_view view_secgrp_grp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY protected_view
    ADD CONSTRAINT view_secgrp_grp FOREIGN KEY (group_id) REFERENCES security_group(group_id);


--
-- PostgreSQL database dump complete
--

